import os
from time import sleep
import requests as r
from bs4 import BeautifulSoup as bs
from selenium import webdriver
from selenium.common.exceptions import WebDriverException


class RBCCategoryParser:
    def __init__(
            self,
            logger,
            target,
            scroll_cooldown,
            selenium_domain,
            selenium_port,
            ):

        self.log = logger
        self.protocol = "https"
        self.site = "www.rbc.ru"
        self.target = target
        self.SCROLL_COOLDOWN = scroll_cooldown

        self.selenium_domain = selenium_domain
        self.selenium_port = selenium_port
        self.fetching = False

    def fetch(self) -> bool:
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
        print(drv)

        # Load the webpage
        try:
            drv.get(self.protocol + "://" + self.site + self.target)
        except WebDriverException:
            raise TimeoutError("Parser timed out")

        # Get more articles by scrolling down
        last_height = drv.execute_script("return document.body.scrollHeight")
        while True:
            # Scroll down to the bottom
            drv.execute_script(
                "window.scrollTo(0, document.body.scrollHeight);"
            )

            # Wait to load more articles
            sleep(self.SCROLL_COOLDOWN)

            # Calculate new scroll height and compare with last scroll height
            new_height = drv.execute_script(
                "return document.body.scrollHeight"
            )
            if new_height == last_height:
                break
            last_height = new_height

        # Get page HTML source from Selenium driver
        html = drv.page_source

        # Parse page source with beautifulsoup
        soup = bs(html, features="html.parser")
        # Find all article links
        data = soup.findAll("a", {"class": "item__link"})

        # Placeholder for articles
        # Format:
        # {
        #     "<ArticleID>": {
        #         "title": "<Foo Bar fizz bazz>",
        #         "preamble": "<Some intro text about Bar>",
        #         "tldr": "<Short description of foo event>"
        #     }
        # }
        articles = {}

        for news in data:
            news_link = news["href"]
            rncontent = r.get(news_link)
            ndata = bs(rncontent.text, features="html.parser")

            # Collect title
            title = ndata.find("h1").text.strip()

            # Collect preamble (it doesn't always exist!)
            try:
                preamble = ndata.find(
                    "div",
                    {"class": "article__header__yandex"}
                ).text.strip()
            except Exception:
                preamble = None  # Sadness

            # Collect tldr (it also doesn't always exist!!)
            try:
                tldr = ndata.find(
                    "div",
                    {"class": "article__text__overview"}
                ).text.strip()
            except Exception:
                tldr = None      # Also sadness

            # [DEBUG] Print article metadata
            # print("TITLE:", title)
            # print("PREAMBLE:", preamble)
            # print("TLDR:", tldr)

            # Construct the article's entry
            article = {
                "source": "rbc-technology_and_media",
                "title": title,
                "preamble": preamble,
                "tldr": tldr
            }

            # Add the atricle to articles
            articles[news_link.split("/")[-1]] = article

            # [DEBUG] Print the article's body
            # print(body)

            # Send article to db
            # self.db.add_article(news_link.split("/")[-1], article)

            # [DEBUG] Print article
            print(news_link.split("/")[-1], article)

        # Close the Selenium session
        try:
            drv.quit()
        except Exception:
            print("Selenium failed on quit(). It probably already closed the session (Docker).\nException: {exc}")

        # [DEBUG] Statistics
        # links_found = len(data)
        # print(f"LINKS FOUND: {links_found}")

        # [DEBUG] Return atricles
        # return articles
        # Unset the fetching flag
        self.fetching = False
        return True

    # def _sync_db(self, articles):
    #     for article in articles:
    #         db.add_article(article, articles[article])


if __name__ == "__main__":
    rbc = RBCCategoryParser(
        None,
        "/technology_and_media",
        2,
        os.getenv("DS_NEWS_PARSER_SELENIUM_DOMAIN"),
        os.getenv("DS_NEWS_PARSER_SELENIUM_PORT")
    )
    rbc.fetch()
