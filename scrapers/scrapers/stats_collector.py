import requests
from scrapy import Spider
from scrapy.statscollectors import StatsCollector


class StatsPersistence(StatsCollector):
    def _persist_stats(self, stats, spider: Spider):
        api_host = spider.crawler.settings.get("API_HOST")
        api_port = spider.crawler.settings.get("API_PORT")
        api_key = spider.crawler.settings.get("API_KEY")
        stats_model = dict(
            crawl_started=stats.get("start_time").isoformat(),
            crawl_ended=stats.get("finish_time").isoformat(),
            time_elapsed=stats.get("elapsed_time_seconds"),
            number_requests=stats.get("downloader/request_count", 0),
            number_response=stats.get("downloader/response_count", 0),
            number_response_200=stats.get("downloader/response_status_count/200", 0),
            crawler_name=spider.name,
            finished_reason=stats.get("finish_reason"),
            items_scraped=stats.get("item_scraped_count", 0),
        )
        requests.post(
            url=f"http://{api_host}:{api_port}/scraper/scraper-stats",
            json=stats_model,
            headers={"x-api-key": api_key},
        )
