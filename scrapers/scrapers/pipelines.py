import json
from collections import defaultdict
from datetime import date
from pathlib import Path

import requests
from itemadapter import ItemAdapter
from pydantic import BaseModel, ValidationError
from scrapy.exceptions import DropItem

from scrapers.validators import Price as PriceModel


class ValidationPipeline:
    def __init__(self):
        self.errors_file = self._create_validation_file()
        self.errors = []

    def process_item(self, item, spider):
        """
        Validates the item with the pydantic model defined in validators.py
        and drops item if the item does not pass the validation
        :param item: current item
        :param spider: unused
        :return: The pydantic model
        """
        item_adapter = ItemAdapter(item=item)
        try:
            estate_model = PriceModel.validate(item_adapter)
            return estate_model
        except ValidationError as e:
            item_dict = item_adapter.asdict()
            item_dict["_validation"] = defaultdict(list)
            for error in e.errors():
                field_name = "/".join(str(loc) for loc in error["loc"])
                item_dict["_validation"][field_name] = error["msg"]
            self.errors.append(item_dict)
            raise DropItem

    def _create_validation_file(self):
        """
        Create a file where all the items with validation errors are stored
        """
        validation_path = Path(f"errors/{date.today()}-errors.json")
        validation_path.parent.mkdir(parents=True, exist_ok=True)
        return validation_path

    def close_spider(self, spider):
        """
        Save all items that did not pass the validation in a json file
        """
        if len(self.errors) > 0:
            with open(self.errors_file, "w") as f:
                json.dump(self.errors, f, indent=4)


class RestPipeline:
    def __init__(self, api_host, api_port, api_key):
        self.api_host = api_host
        self.api_port = api_port
        self.api_key = api_key

    @classmethod
    def from_crawler(cls, crawler):
        return cls(
            api_host=crawler.settings.get("API_HOST"),
            api_port=crawler.settings.get("API_PORT"),
            api_key=crawler.settings.get("API_KEY"),
        )

    def process_item(self, item: BaseModel, spider):
        """
        Post the item to the Rest API and returns it.
        """
        requests.post(
            url=f"http://{self.api_host}:{self.api_port}/scraper/prices",
            json=item.dict(),
            headers={"x-api-key": self.api_key},
        )
        return item
