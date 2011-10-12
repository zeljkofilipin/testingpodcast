def create_draft_post(browser, podcast, testingpodcast)
  browser.goto "#{testingpodcast}wp-admin/post-new.php"
  browser.text_field(:id => "title").set podcast.title
  content = "[caption width='100' caption='Rex Black']<img src='#{testingpodcast}wp-content/uploads/rex_black.jpg' alt=''Rex Black' title='Rex Black' />[/caption]\n\nShow notes: <a href='#{podcast.url}'>#{podcast.title}</a>"
  browser.text_field(:id => "content").set content
  browser.checkbox(:id => "in-category-14").set
  browser.text_field(:id => "new-tag-post_tag").set "Rex Black"
  browser.button(:value => "Add").click
  browser.button(:value => "Add Media File").click
  browser.text_field(:id => "podPressMedia_0_URI").set "http://www.podtrac.com/pts/redirect.mp3/www.rbcs-us.com/media/podcasts/#{podcast.mp3}"
  browser.text_field(:id => "podPressMedia_0_title").set podcast.mp3

  # workaround for a bug
  browser.select_list(:id => "podPressMedia_0_type").select "OGG - Audio File"
  browser.select_list(:id => "podPressMedia_0_type").select "MP3 - Standard Audio (iPod Compliant)"

  browser.button(:id => "podPressMedia_0_size_detectbutton").click
  browser.button(:id => "podPressMedia_0_duration_detectbutton").click
  browser.select_list(:id => "iTunesAuthorChoice").select "Custom"
  browser.text_field(:name => "iTunesAuthor").set "Rex Black"

  browser.button(:id => "save-post").click
end

require "watir-webdriver"

browser = Watir::Browser.new :ff
site = "http://www.rbcs-us.com/software-testing-resources/podcast"

testingpodcast = "http://testingpodcast.com/"
require "login"
log_in(browser, testingpodcast, password)

require "podcast"
numbers = (43..78)

numbers.each do |number|
  url = "#{site}/#{number}"
  browser.goto url

  title = browser.cell(:class => 'contentheading', :index => 1).text
  path = browser.object(:index => 0).data.split("?song_url=")[1].split("&song_title=")[0] if browser.object(:index => 0).exists? and browser.object(:index => 0).data != ""

  if path
    podcast = Podcast.new(url, title, path)
    puts podcast.to_s
    create_draft_post(browser, podcast, testingpodcast)
  end
end
