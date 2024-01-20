from scrapy import Field, Item


class EstateItem(Item):
    estate_id = Field()
    link = Field()
    area = Field()
    rooms = Field()
    display_name = Field()
    location = Field()
    postal_code = Field()
    street = Field()
    lat = Field()
    lon = Field()
    construction_year = Field()

    price_item = Field()


class PriceItem(Item):
    price = Field()
    scraped_at = Field()
    source = Field()
    estate_id = Field()
