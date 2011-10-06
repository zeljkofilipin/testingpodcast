def log_in(browser, site, password)
  browser.goto "#{site}wp-login.php"
  browser.text_field(:id => "user_login").set "zeljko.filipin"
  browser.text_field(:id => "user_pass").set password
  browser.button(:id => "wp-submit").click
end
def categories(browser)
  browser.ul(:id => "categorychecklist").labels.collect do |label|
    label.text if label.input.checked?
  end.compact
end
def tags(browser)
  browser.div(:class => "tagchecklist").spans.collect do |span|
    span.text
  end
end
def get_post_data(browser, site, post_number, index)
  browser.goto "#{site}wp-admin/post.php?post=#{post_number}&action=edit"
  url = browser.url
  title = browser.input(:id => "title").value

  browser.span(:id => "editable-post-name").click
  permalink = browser.input(:id => "new-post-slug").value

  text = browser.textarea(:id => "content").text
  mp3_location = browser.input(:id => "podPressMedia_0_URI").value
  mp3_title = browser.input(:id => "podPressMedia_0_title").value
  mp3_type = browser.select(:id => "podPressMedia_0_type").selected_options
  mp3_file_size = browser.input(:id => "podPressMedia_0_size").value
  mp3_duration = browser.input(:id => "podPressMedia_0_duration").value
  mp3_itunes_author = browser.input(:name => "iTunesAuthor").value
  puts "#{index}@#{url}@#{title}@#{permalink}@#{text}@#{categories(browser)}@#{tags(browser)}@#{mp3_location}@#{mp3_title}@#{mp3_type}@#{mp3_file_size}@#{mp3_duration}@#{mp3_itunes_author}"
end
def post_numbers(browser, site)
  browser.goto site
  browser.divs(:class => "post").collect do |post|
    post.a(:text => "Edit").href.split("=")[1].split("&")[0]
  end
end

if __FILE__ == $0
  require "watir-webdriver"

  site = "http://testingpodcast.com/"
  password = ARGV[0]
  browser = Watir::Browser.new :ff

  log_in(browser, site, password)
  puts "index@url@title@permalink@text@categories@tags@mp3_location@mp3_title@mp3_type@mp3_file_size@mp3_duration@mp3_itunes_author"
  post_numbers(browser, site).each_with_index do |post_number, index|
    get_post_data(browser, site, post_number, index)
  end
end


