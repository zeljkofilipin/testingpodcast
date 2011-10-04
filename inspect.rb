require "watir-webdriver"

site = "http://testingpodcast.com/"
browser = Watir::Browser.new :ff

browser.goto site