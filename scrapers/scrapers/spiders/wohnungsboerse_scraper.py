import re
from urllib.parse import urlencode

import scrapy

from scrapers.functions import get_district_information
from scrapers.items import EstateItem, PriceItem


class WohnungsboerseScraperSpider(scrapy.Spider):
    name = "wohnungsboerse-scraper"
    allowed_domains = ["www.wohnungsboerse.net"]
    start_urls = ["https://www.wohnungsboerse.net/"]
    base_url = "https://www.wohnungsboerse.net"

    def start_requests(self):
        district_information = get_district_information(replace_umlaut=True)
        for di in list(district_information)[1:2]:
            path = "searches/index"
            query = {
                "estate_marketing_types": "miete,1",
                "marketing_type": "miete",
                "estate_types[0]": "1",
                "is_rendite": "0",
                "zipcode_city": "Duesseldorf",
                "term": "Duesseldorf",
                "districts[]": di["district_name"],
            }
            yield scrapy.Request(
                url=f"{self.base_url}/{path}?{urlencode(query)}",
                callback=self.parse,
                cb_kwargs={"di": di},
            )

    def parse(self, response, di):
        links = response.xpath(
            "//section[contains(@class, 'search_result_container')]/a/@href"
        ).getall()
        for link in links:
            yield scrapy.Request(
                url=link, callback=self.parse_estate, cb_kwargs={"di": di}
            )

    def parse_estate(self, response, di):
        display_name = response.xpath(
            "//h2[@class='font-bold tracking-tight text-h4 "
            "lg:text-h3 mb-4 md:mb-8']/text()"
        ).get()
        address = response.xpath("//div[@class='pl-4 md:pl-5 w-52']/text()").getall()
        street, postal_code = self.extract_location_information(address)
        price = response.xpath("//meta[@itemprop='price']/@content").get()
        rooms = response.xpath(
            "//div[@itemprop='numberOfRooms']/meta[@itemprop='value']/@content"
        ).get()
        size = response.xpath(
            "//div[@itemprop='floorSize']/meta[@itemprop='value']/@content"
        ).get()
        lat = response.xpath(
            "//div[@itemprop='geo']/meta[@itemprop='latitude']/@content"
        ).get()
        lon = response.xpath(
            "//div[@itemprop='geo']/meta[@itemprop='longitude']/@content"
        ).get()
        estate_id = response.url.split("/")[-1]

        t = response.xpath("//table[@class='w-full [&_td]:py-2 mt-4']//text()").getall()
        text = "".join([ti.strip() for ti in t])
        res = re.search("Baujahr:([0-9]*)", text)
        if res:
            construction_year = res.group(1)
        else:
            construction_year = None

        estate_item = EstateItem(
            estate_id=estate_id,
            link=response.url,
            area=size,
            rooms=rooms,
            display_name=display_name,
            district_number=di["district_number"],
            postal_code=postal_code,
            street=street,
            lat=lat,
            lon=lon,
            construction_year=construction_year,
        )

        yield PriceItem(price=price, source="Wohnungsboerse", estate=estate_item)

    def extract_location_information(self, address):
        if len(address) > 1:
            street = address[0].strip()
            postal_code = address[1].split()[0]
        else:
            street = ""
            postal_code = address[0].split()[0]
        return street, postal_code
