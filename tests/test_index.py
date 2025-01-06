import time

from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from webdriver_manager.firefox import GeckoDriverManager


def setup_driver():
    options = webdriver.FirefoxOptions()
    options.add_argument("--headless")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")

    driver = webdriver.Firefox(
        service=Service(GeckoDriverManager().install()), options=options
    )
    return driver


def test_positive_index_page():
    driver = setup_driver()
    driver.get("http://127.0.0.1:5000/")

    time.sleep(2)

    assert "Viana Labs" in driver.title, "The page title is incorrect!"
    print("Test Passed Sucessfully: Home Page is correct!")

    driver.quit()


if __name__ == "__main__":
    test_positive_index_page()
