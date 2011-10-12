def log_in(browser, site, password)
  browser.goto "#{site}wp-login.php"
  browser.text_field(:id => "user_login").set "zeljko.filipin"
  browser.text_field(:id => "user_pass").set password
  browser.button(:id => "wp-submit").click
end