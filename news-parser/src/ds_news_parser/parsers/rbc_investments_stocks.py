import os
from time import sleep
import requests
from urllib import parse as urlparse
from bs4 import BeautifulSoup as bs
from selenium import webdriver
from selenium.common.exceptions import WebDriverException
from loguru import logger
from pymongo.errors import DuplicateKeyError

from ds_news_parser.models.stock_info import StockInfo
from ds_news_parser.db.repositories.stock_info import StockInfoRepository
from ds_news_parser.db.repositories.article import ArticleRepository


class RBCInvestmentsStocksParser:
    def __init__(
            self,
            selenium_domain: str,
            selenium_port: str,
            repo: StockInfoRepository,
            article_repo: ArticleRepository,
            ):
        self.article_repo = article_repo
        self.repo = repo

        self.selenium_domain = selenium_domain
        self.selenium_port = selenium_port
        self.fetching = False

    def parse(self) -> bool:
        # If already fetching, quit
        if self.fetching:
            return False
        # Set the fetching flag
        self.fetching = True

        # Set up Selenium driver
        selenff_options = webdriver.FirefoxOptions()
        selenff_options.set_preference("http.response.timeout", 5)
        selenff_options.set_preference("dom.max_script_run_time", 5)
        # drv = webdriver.Remote(
        #     f"http://{self.selenium_domain}:{self.selenium_port}/wd/hub",
        #     options=selenff_options
        # )
        # print(drv)

        # # Load the webpage
        # try:
        #     drv.get(self.url)
        # except WebDriverException:
        #     raise TimeoutError("Parser timed out")

        articles_cur = self.article_repo.find_by({})
        for article in articles_cur:
            for stock in article.stocks:
                logger.info(f"Getting stock info ({stock.symbol}, {stock.link})")
                if self.repo.find_one_by({"symbol": stock.symbol}):
                    logger.info(f"Stock's ({stock.symbol}) description is already in the db.")
                    continue
                page = requests.get(stock.link)
                soup = bs(page.text, features="html.parser")
                description = soup.find(
                    "div",
                    {"class": "MuiGrid-root MuiGrid-container MuiGrid-item MuiGrid-grid-xs-12 quote-style-iw9t5x"}
                )
                if description is not None:
                    description_text = description.text.strip()
                else:
                    description_text = None
                logger.info(description_text)
                try:
                    self.repo.save(StockInfo(
                        symbol=stock.symbol,
                        description=description_text
                    ))
                except DuplicateKeyError:
                    logger.info(f"Description for {stock.symbol} is already saved.")

        logger.info("Stocks parsing completed successfully.")


if __name__ == "__main__":
    rbc = RBCInvestmentsStocksParser(
        2,
        os.getenv("DS_NEWS_PARSER_SELENIUM_DOMAIN"),
        os.getenv("DS_NEWS_PARSER_SELENIUM_PORT"),
        None
    )
    rbc.parse()
