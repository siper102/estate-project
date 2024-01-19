from scrapy.exceptions import DropItem
from sqlalchemy.inspection import inspect
from sqlalchemy.orm import sessionmaker
from itemadapter import ItemAdapter
from pydantic import ValidationError
from pathlib import Path
from datetime import date
from collections import defaultdict
import json

from scrapers.model import Base, Estate, Price
from scrapers.functions import get_engine
from scrapers.validators import Estate as EstateModel


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
            estate_model = EstateModel.validate(item_adapter)
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


class DatabasePipeline:
    def __init__(self):
        self.engine = get_engine()
        self.session_maker = sessionmaker(bind=self.engine, autoflush=False)
        self.inspector = inspect(self.engine)

    def process_item(self, item, spider):
        """
        Save the current processed item in the database and returns the item.
        ItemAdapter is used since the input type can be different depending on
        the pipeline step performed before saving.
        :param item: current item
        :param spider: unused
        :return: the item that is processed
        """
        estate_item = ItemAdapter(item=item)
        price_item = estate_item.pop("price_item")
        with self.session_maker.begin() as session:
            estate_orm = self.get_estate_orm(estate_item=estate_item, session=session)
            price_orm = Price(**price_item)
            estate_orm.price.append(price_orm)
            session.add(estate_orm)
            session.commit()
        return estate_item.item

    def get_estate_orm(self, estate_item, session):
        """
        Check if current item is already persisted in the database and
        if so return this item. Else convert the item to an Estate ORM object
        :param estate_item: The current processed item
        :param session: a database session (sqlalchemy.orm.Session)
        :return: Estate ORM object (see model.py)
        """
        estate_id = estate_item["estate_id"]
        estate_orm = session.query(Estate).filter(Estate.estate_id == estate_id).first()
        if not estate_orm:
            estate_orm = Estate(**estate_item.asdict())
        return estate_orm
