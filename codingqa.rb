require "watir-webdriver"

site = "http://codingqa.com/"
browser = Watir::Browser.new :ff

browser.goto site