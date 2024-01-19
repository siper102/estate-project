import scrapy
from urllib.parse import urlencode
import re
from scrapers.items import EstateItem, PriceItem
from datetime import datetime
from scrapers.functions import get_district_information


class ImmoweltScraperSpider(scrapy.Spider):
    name = "immowelt-scraper"
    base_url = "https://www.immowelt.de"

    def start_requests(self):
        district_information = get_district_information(replace_umlaut=True)
        for di in district_information:
            path = f"suche/duesseldorf-{di['district_name'].lower()}/wohnungen/mieten"
            query = {
                "lat": di["lat"],
                "lon": di["lon"],
                "sort": "relevanz distance",
                "sr": "3",
                "version": "v2",
            }
            yield scrapy.Request(
                url=f"{self.base_url}/{path}?{urlencode(query)}",
                callback=self.parse,
                cb_kwargs={"di": di},
            )

    def parse(self, response, di):
        items = response.xpath("//div[contains(@class, 'EstateItem')]")
        for item in items:
            estate_id = item.xpath("a/@id").get()
            link = item.xpath("a/@href").get()

            fact_section = item.xpath("a/div[contains(@class, 'FactsSection')]")
            key_facts = fact_section.xpath("div/div[contains(@class, 'KeyFacts')]")

            price = key_facts.xpath("div[@data-test='price']/text()").get()
            area = key_facts.xpath("div[@data-test='area']/text()").get()
            rooms = key_facts.xpath("div[@data-test='rooms']/text()").get()
            display_name = fact_section.xpath("div/div/h2/text()").get()

            estate_facts = fact_section.xpath(
                "div/div/div[contains(@class, 'estateFacts')]"
            )
            location = estate_facts.xpath("div/span/text()").get()

            if di["district_name"].lower() in location.lower():
                price_item = PriceItem(
                    price=price.replace(".", "").replace(",", ".").replace(" €", ""),
                    scraped_at=datetime.now(),
                    source="Immowelt",
                    estate_id=estate_id,
                )
                estate_item = EstateItem(
                    estate_id=estate_id,
                    link=link,
                    area=self._extract_float(area),
                    rooms=self._extract_float(rooms),
                    display_name=display_name,
                    location=di["district_number"],
                    price_item=price_item,
                    construction_year=None,
                )
                yield scrapy.Request(
                    url=link,
                    callback=self.parse_estate,
                    cb_kwargs={"item": estate_item},
                )

    def _extract_float(self, result):
        if result:
            res = re.search(r"(?P<float>[0-9]*)", result)
            return res.groupdict().get("float")
        else:
            return None

    def parse_estate(self, response, item):
        location_information = response.xpath(
            "//app-estate-address/div/sd-cell/sd-cell-row/sd-cell-col[@class='cell__col is-center-v']"
        )
        street = location_information.xpath(
            "span[@data-cy='address-street']/text()"
        ).get()
        if "nicht freigegeben" in street:
            street = None
        address_information = location_information.xpath(
            "span[@data-cy='address-city']"
        )
        place = address_information.xpath("div[1]/text()").get()
        postal_code = re.search("[0-9]{5}", place)[0]

        j = response.xpath("//script[@id='serverApp-state']/text()").get()
        res = re.search(r"ConstructionYear&q;:&q;([0-9]*)", j)
        if res:
            item["construction_year"] = res.group(1)

        item["postal_code"] = postal_code
        item["street"] = street
        yield item
