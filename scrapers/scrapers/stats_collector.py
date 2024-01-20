from scrapy import Spider
from scrapy.statscollectors import StatsCollector
from sqlalchemy.orm import sessionmaker

from scrapers.functions import get_engine

from .model import ScraperStats


class StatsPersistence(StatsCollector):
    def _persist_stats(self, stats, spider: Spider):
        cred = spider.settings["DATABASE_CREDENTIALS"]
        engine = get_engine(cred)
        sess_maker = sessionmaker(bind=engine, autoflush=False)
        with sess_maker.begin() as session:
            stats_model = ScraperStats(
                crawl_started=stats.get("start_time"),
                crawl_ended=stats.get("finish_time"),
                time_elapsed=stats.get("elapsed_time_seconds"),
                number_requests=stats.get("downloader/request_count", 0),
                number_response=stats.get("downloader/response_count", 0),
                number_response_200=stats.get(
                    "downloader/response_status_count/200", 0
                ),
                crawler_name=spider.name,
                finished_reason=stats.get("finish_reason"),
                items_scraped=stats.get("item_scraped_count", 0),
            )
            session.add(stats_model)
            session.commit()
