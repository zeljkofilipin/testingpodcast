def log_in(browser, site, password)
  browser.goto "#{site}wp-login.php"
  browser.text_field(:id => "user_login").set "zeljko.filipin"
  browser.text_field(:id => "user_pass").set password
  browser.button(:id => "wp-submit").click
end
def get_post_numbers(browser, site)
  browser.goto site
  browser.divs(:class => "post").collect do |post|
    post.a(:text => "Edit").href.split("=")[1].split("&")[0]
  end
end

if __FILE__ == $0
  require "watir-webdriver"

  site = "http://testingpodcast.com/"
  browser = Watir::Browser.new :ff
  password = ARGV[0]

  log_in(browser, site, password)
  puts get_post_numbers(browser, site).inspect
end


