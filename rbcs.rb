require "rubygems"
require "watir-webdriver"

browser = Watir::Browser.new :ff
site = "http://www.rbcs-us.com/software-testing-resources/podcast"

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
  end
end


