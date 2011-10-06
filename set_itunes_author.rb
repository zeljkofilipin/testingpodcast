def log_in(browser, site, password)
  browser.goto "#{site}wp-login.php"
  browser.text_field(:id => "user_login").set "zeljko.filipin"
  browser.text_field(:id => "user_pass").set password
  browser.button(:id => "wp-submit").click
end
def post_numbers(browser, site)
  browser.goto site
  browser.divs(:class => "post").collect do |post|
    post.a(:text => "Edit").href.split("=")[1].split("&")[0]
  end
end
def set_itunes_author(browser, site, post_number)
  browser.goto "#{site}wp-admin/post.php?post=#{post_number}&action=edit"
  category = browser.ul(id: "categorychecklist").checkbox.parent.text
  browser.select(id: "iTunesAuthorChoice").select "Insert custom value"
  browser.text_field(name: "iTunesAuthor").set category
  browser.button(id: "publish").click
end
if __FILE__ == $0
  require "watir-webdriver"

  site = "http://testingpodcast.com/"
  password = ARGV[0]
  browser = Watir::Browser.new :ff

  log_in(browser, site, password)
  post_numbers(browser, site).each do |post_number|
    set_itunes_author(browser, site, post_number)
  end
end


