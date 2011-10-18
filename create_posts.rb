def create_post(browser, podcast, site)
  number = podcast[:number]

  matthew = "Matthew Osborn"
  federico = "Federico Silva Armas"

  mark = "Mark Berryman"
  jim = "Jim Wang"

  browser.goto "#{site}wp-admin/post-new.php"

  title = podcast[:title]
  browser.text_field(:id => "title").set title

  if number < 50
    caption = "[caption width='150' caption='#{matthew} and #{federico}']<img src='#{site}wp-content/uploads/matthew.jpg' alt='#{matthew}' title='#{matthew}' /> <img src='#{site}wp-content/uploads/federico.jpg' alt='#{federico}' title='#{federico}' />[/caption]"
  else
    caption = "[caption width='150' caption='#{mark} and #{jim}']<img src='#{site}wp-content/uploads/mark_berryman.jpg' alt='#{mark}' title='#{mark}' /> <img src='#{site}wp-content/uploads/jim_wang.jpg' alt='#{jim}' title='#{jim}' />[/caption]"
  end
  content = "#{caption}\n\nShow notes: <a href='#{podcast[:url]}'>#{podcast[:title]}</a>"
  browser.text_field(:id => "content").set content

  date = podcast[:date]
  browser.a(href: "#edit_timestamp").click

  month = date.split(" ")[2][0, 3]
  browser.select(id: "mm").select month

  day = date.split(" ")[1]
  browser.text_field(id: "jj").set day

  year = date.split(" ")[3]
  browser.text_field(id: "aa").set year

  category = "in-category-1"
  browser.checkbox(:id => category).set

  if number < 50
    tags = "#{matthew}, #{federico}"
  else
    tags = "#{mark}, #{jim}"
  end
  browser.text_field(:id => "new-tag-post_tag").set tags
  browser.button(:value => "Add").click

  browser.button(:value => "Add Media File").click

  mp3_url = podcast[:mp3].sub("http://", "")
  browser.text_field(:id => "podPressMedia_0_URI").set "http://www.podtrac.com/pts/redirect.mp3/#{mp3_url}"

  mp3_file_name = "Podcast.mp3"
  browser.text_field(:id => "podPressMedia_0_title").set mp3_file_name

=begin
  # if you do not do this dance, duration text field does not appear
  browser.select_list(:id => "podPressMedia_0_type").select "M4A - Enhanced Audio (iPod Compliant)"
  browser.select_list(:id => "podPressMedia_0_type").select "MP3 - Standard Audio (iPod Compliant)"

  browser.button(:id => "podPressMedia_0_size_detectbutton").click
  browser.button(:id => "podPressMedia_0_duration_detectbutton").click
=end

  itunes_author = "Coding QA Podcast"
  browser.select(id: "iTunesAuthorChoice").select "Insert custom value"
  browser.text_field(:name => "iTunesAuthor").set itunes_author

  browser.button(id: "publish").click
end
def podcasts
  # arrary of hashes goes here, see the bottom of codingqa.rb file for example
end

if __FILE__ == $0
  require "watir-webdriver"

  site = "http://testingpodcast.com/"
  password = ARGV[0]
  browser = Watir::Browser.new :ff

  require "./login"
  log_in(browser, site, password)

  podcasts.each do |podcast|
    create_post(browser, podcast, site)
  end
end