import os
from time import sleep
import requests
from requests.exceptions import ReadTimeout
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
        drv = webdriver.Remote(
            f"http://{self.selenium_domain}:{self.selenium_port}/wd/hub",
            options=selenff_options
        )
        drv.set_page_load_timeout(7)
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
                rbc_soup = bs(page.text, features="html.parser")
                tcs_soup = None
                description = rbc_soup.find(
                    "div",
                    {"class": "MuiGrid-root MuiGrid-container MuiGrid-item MuiGrid-grid-xs-12 quote-style-iw9t5x"}
                )
                if description is not None:
                    description_text = description.text.strip()
                else:
                    description_text = None
                logger.info(f"Description text (before Tinkoff Stocks): {description_text}")

                # Tinkoff Stocks Description & Sector

                sector_text: str | None = None

                tinkoff_response = None
                tinkoff_url = f"https://www.tinkoff.ru/invest/stocks/{stock.symbol}"
                logger.error(f"Requesting {tinkoff_url}")

                try:
                    drv.get(tinkoff_url)
                except WebDriverException:
                    raise TimeoutError("Parser timed out")
                else:  # Nothing went wrong

                    # Check if we arrived on page 404
                    # h1 ErrorPageDesktop-module__title_x1q0O
                    # TODO: Check if this h1 sappears elsewhere

                    tcs_soup = bs(drv.page_source, features="html.parser")
                    tcs_is_404 = tcs_soup.find(
                        "h1",
                        {"class": "ErrorPageDesktop-module__title_x1q0O"}
                    ) is not None
                    if tcs_is_404:
                        logger.warning(f"Tinkoff 404'd for stock {stock.symbol}")
                    else:
                        if description_text is None:
                            logger.info(f"Getting stock info for {stock.symbol} on Tinkoff")
                            description = tcs_soup.find(
                                "div",
                                {"class": "TruncateHTML__lineClamp_dx9Qy"}
                            )

                            if description is not None:
                                description_text = description.text.strip()
                                logger.warning(f"Description for {stock.symbol} on Tinkoff: {description_text}")
                            else:
                                logger.warning(f"Not found description for {stock.symbol} on Tinkoff")

                        sector = tcs_soup.find(
                            "div",
                            {"class": "SecurityHeader__panel_itBzT SecurityHeader__desktop_dL7RD"}
                        )
                        if sector is not None:
                            sector = sector.find(
                                "div",
                                {"class": "SecurityHeader__panelText_KDJdO"}
                            )
                            sector_text = sector.text.strip()

                # Company name
                company_text: str | None = None
                if tcs_soup is not None and not tcs_is_404:
                    # Get name from Tinkoff first; its naming is better
                    company = tcs_soup.find(
                        "span",
                        {"class": "SecurityHeader__showName_iw6qC"}
                    )
                    if company is not None:
                        company_text = company.text.strip()

                if company_text is None:
                    company = rbc_soup.find(
                        "h1",
                        {"class": "MuiTypography-root MuiTypography-h1 quote-style-j89rq3"}
                    )
                    if company is not None:
                        company_text = company.text.strip()

                try:
                    self.repo.save(StockInfo(
                        symbol=stock.symbol,
                        company=company_text,
                        description=description_text,
                        sector=sector_text,
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
