def log_in(browser, site)
  browser.goto "#{site}wp-login.php"
  browser.text_field(:id => "user_login").set "" # enter user name
  browser.text_field(:id => "user_pass").set "" # enter password
  browser.button(:id => "wp-submit").click
end
def get_post_numbers(browser, site)
  browser.goto site
  browser.divs(:class => "post").collect do |post|
    post.a(:text => "Edit").href.split("=")[1].split("&")[0]
  end
end
require "watir-webdriver"

site = "http://testingpodcast.com/"
browser = Watir::Browser.new :ff

log_in(browser, site)
puts get_post_numbers(browser, site).inspect
