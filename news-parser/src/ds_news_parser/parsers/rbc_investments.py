import os
from time import sleep
# import requests as r
from urllib import parse as urlparse
from bs4 import BeautifulSoup as bs
from selenium import webdriver
from selenium.common.exceptions import WebDriverException
from loguru import logger
from pymongo.errors import DuplicateKeyError
from datetime import datetime

from ds_news_parser.models.article import Article, Stock
from ds_news_parser.db.repositories.article import ArticleRepository


class RBCInvestmentsParser:
    def __init__(
            self,
            scroll_cooldown: int,
            selenium_domain: str,
            selenium_port: str,
            repo: ArticleRepository | None,  # If None, output to stdout
            max_scroll_count: int = 3,  # -1 to disable
            ):
        self.protocol = "https"
        self.site = "quote.ru"
        self.base_url = self.protocol + "://" + self.site
        self.target = "/category/all"
        self.url: str = urlparse.urljoin(
            self.base_url,
            self.target
        )

        self.repo = repo

        self.SCROLL_COOLDOWN = scroll_cooldown
        self.MAX_SCROLL_COUNT = max_scroll_count

        self.selenium_domain = selenium_domain
        self.selenium_port = selenium_port

    def _construct_full_url(self, path: str) -> str:
        return urlparse.urljoin(
            self.base_url,
            path
        )

    def parse(self) -> bool:
        # Set up Selenium driver
        selenff_options = webdriver.FirefoxOptions()
        selenff_options.set_preference("http.response.timeout", 5)
        selenff_options.set_preference("dom.max_script_run_time", 5)
        drv = webdriver.Remote(
            f"http://{self.selenium_domain}:{self.selenium_port}/wd/hub",
            options=selenff_options
        )
        print(drv)

        # Load the webpage
        try:
            drv.get(self.url)
        except WebDriverException:
            raise TimeoutError("Parser timed out")

        # Get more articles by scrolling down
        last_height = drv.execute_script("return document.body.scrollHeight")
        scroll_count = 0
        retry_count = 0  # Retries of the same page
        while True:
            logger.info(f"Getting page {scroll_count + 1}")
            # Scroll down to the bottom
            drv.execute_script(
                "window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });"
            )
            if retry_count % 2 == 0 and retry_count not in [0, 2]:
                drv.execute_script(
                    "window.scrollTo({ top: 0, behavior: 'smooth' });"
                )
                sleep(3)
                drv.execute_script(
                    "window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });"
                )

            # Wait to load more articles
            logger.info(f"Sleeping for {self.SCROLL_COOLDOWN} seconds.")
            sleep(self.SCROLL_COOLDOWN)

            # Calculate new scroll height and compare with last scroll height
            new_height = drv.execute_script(
                "return document.body.scrollHeight"
            )

            if scroll_count == self.MAX_SCROLL_COUNT - 1:
                logger.info(f"Stopped scrolling because reached max scroll count at page {scroll_count + 1}")
                break

            if new_height == last_height:
                if retry_count >= 7:
                    logger.info(f"Stopped getting any new updates at page {scroll_count + 1}")
                    break
                logger.info(f"Retrying (attempt {retry_count})")
                retry_count += 1
            else:
                retry_count = 0
                scroll_count += 1

            last_height = new_height

        # Get page HTML source from Selenium driver
        html = drv.page_source

        # Parse page source with beautifulsoup
        soup = bs(html, features="html.parser")
        # Find all article links
        news = soup.find_all(
            "div",
            {"class", "MuiGrid-root MuiGrid-container MuiGrid-item MuiGrid-grid-xs-12 quote-style-1akz3yj"}
        )
        # print(data)

        for raw_article in news:
            raw_stocks = raw_article.find_all(
                "a",
                {"class": "MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineNone quote-style-17sapxj"}
            )
            title: str = raw_article.find(
                "div",
                {"class": "MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 quote-style-t3crvi"}
            ).text.strip()

            tldr: str = raw_article.find(
                "div",
                {"class": "MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 quote-style-idahbs"}
            ).text.strip()

            link: str = raw_article.find(
                "a",
                {"class": "MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineNone quote-style-1afmlf2"}
            ).text.strip()

            timestamps_raw = raw_article.find_all(
                "div",
                {"class": "MuiGrid-root MuiGrid-item MuiGrid-grid-xs-auto quote-style-1r0qme3"}
            )

            timestamp: datetime | None = None
            for ts in timestamps_raw:
                try:
                    timestamp = datetime.strptime(ts.text.strip(), "%d.%m.%y, %H:%M")
                except ValueError:
                    continue

            stocks: list[Stock] = []
            for raw_stock in raw_stocks:
                attrs = raw_stock.attrs
                stock_symbol = raw_stock.find(
                    "div",
                    {"class": "MuiGrid-root MuiGrid-container MuiGrid-item MuiGrid-grid-xs-auto quote-style-l536r3"}
                ).text.strip()
                stock_link = self._construct_full_url(attrs["href"])  # Tickers
                stocks.append(
                    Stock(
                        symbol=stock_symbol,
                        link=stock_link
                    )
                )
            article = Article(
                title=title,
                tldr=tldr,
                link=link,
                timestamp=timestamp,
                stocks=stocks,
                tags=[],
            )

            try:
                self.repo.save(article)
            except DuplicateKeyError:
                logger.info(f"Article with title {title} has already been saved.")  # noqa: E501

        # Placeholder for articles
        # Format:
        # {
        #     "<ArticleID>": {
        #         "title": "<Foo Bar fizz bazz>",
        #         "preamble": "<Some intro text about Bar>",
        #         "tldr": "<Short description of foo event>"
        #     }
        # }
        # articles = {}

    #     for news in data:
    #         news_link = news["href"]
    #         rncontent = r.get(news_link)
    #         ndata = bs(rncontent.text, features="html.parser")

    #         # Collect title
    #         title = ndata.find("h1").text.strip()

    #         # Collect preamble (it doesn't always exist!)
    #         try:
    #             preamble = ndata.find(
    #                 "div",
    #                 {"class": "article__header__yandex"}
    #             ).text.strip()
    #         except Exception:
    #             preamble = None  # Sadness

    #         # Collect tldr (it also doesn't always exist!!)
    #         try:
    #             tldr = ndata.find(
    #                 "div",
    #                 {"class": "article__text__overview"}
    #             ).text.strip()
    #         except Exception:
    #             tldr = None      # Also sadness

    #         # Construct the article's entry
    #         article = {
    #             "source": "rbc-technology_and_media",
    #             "title": title,
    #             "preamble": preamble,
    #             "tldr": tldr
    #         }

    #         # Add the atricle to articles
    #         articles[news_link.split("/")[-1]] = article

    #         # [DEBUG] Print article
    #         print(news_link.split("/")[-1], article)

    #     # Close the Selenium session
    #     try:
    #         drv.quit()
    #     except Exception:
    #         print("Selenium failed on quit(). It probably already closed the session (Docker).\nException: {exc}")

    #     # [DEBUG] Statistics
    #     # links_found = len(data)
    #     # print(f"LINKS FOUND: {links_found}")

    #     # [DEBUG] Return atricles
    #     # return articles
    #     # Unset the fetching flag
    #     self.fetching = False
    #     return True

    # # def _sync_db(self, articles):
    # #     for article in articles:
    # #         db.add_article(article, articles[article])


if __name__ == "__main__":
    rbc = RBCInvestmentsParser(
        2,
        os.getenv("DS_NEWS_PARSER_SELENIUM_DOMAIN"),
        os.getenv("DS_NEWS_PARSER_SELENIUM_PORT"),
        None
    )
    rbc.parse()
