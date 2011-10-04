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
  permalink = browser.span(:id => "editable-post-name").text
  text = browser.textarea(:id => "content").text
  mp3_location = browser.input(:id => "podPressMedia_0_URI").value
  mp3_title = browser.input(:id => "podPressMedia_0_title").value
  mp3_type = browser.select(:id => "podPressMedia_0_type").selected_options
  mp3_file_size = browser.input(:id => "podPressMedia_0_size").value
  mp3_duration = browser.input(:id => "podPressMedia_0_duration").value
  mp3_itunes_author = browser.input(:name => "iTunesAuthor").value
  puts "#{index}@#{url}@#{title}@#{permalink}@#{text}@#{categories(browser)}@#{tags(browser)}@#{mp3_location}@#{mp3_title}@#{mp3_type}@#{mp3_file_size}@#{mp3_duration}@#{mp3_itunes_author}"
end

if __FILE__ == $0
  require "watir-webdriver"

  post_numbers = ["2062", "2052", "2044", "2025", "2017", "2010", "2004", "1999", "1990", "1984", "1976", "1966", "1958", "1944", "1938", "1931", "1918", "1909", "1895", "1884", "1888", "1881", "1878", "1873", "1856", "1865", "1851", "1639", "1814", "1810", "1635", "1808", "1630", "1805", "1802", "1622", "1798", "1619", "1790", "1616", "1785", "1774", "1612", "1767", "1608", "1757", "1784", "1601", "1743", "1593", "1750", "1747", "1734", "1749", "1589", "1723", "1584", "1717", "1582", "1702", "1580", "1698", "1578", "1694", "1576", "1685", "1689", "1574", "1680", "1669", "1572", "1570", "1654", "1660", "1568", "1649", "1564", "1647", "1643", "1546", "1553", "1534", "1530", "1527", "1525", "1845", "1532", "1518", "1839", "1509", "1508", "1829", "1505", "1688", "1503", "1501", "1484", "1481", "1820", "1489", "1455", "1451", "1449", "1438", "1436", "1431", "1422", "1198", "1194", "1185", "1183", "1177", "1176", "1164", "1158", "1161", "1077", "1047", "1045", "1046", "1006", "1135", "931", "1004", "1499", "901", "892", "908", "888", "877", "1131", "1129", "935", "1127", "870", "1125", "1285", "866", "1123", "695", "220", "214", "1119", "1117", "1115", "208", "9", "722", "1113", "12", "312", "6", "313", "143", "142", "138", "1111", "314", "151", "1281", "150", "315", "1109", "149", "1107", "316", "1105", "721", "1103", "1200", "317", "318", "319", "320", "117", "148", "321", "609", "322", "147", "323", "917", "324", "325", "610", "405", "79", "326", "327", "328", "329", "330", "404", "64", "331", "115", "1101", "611", "77", "403", "74", "612", "613", "71", "332", "402", "614", "615", "616", "617", "67", "618", "401", "51", "57", "333", "400", "619", "399", "41", "334", "620", "335", "621", "398", "622", "336", "623", "337", "624", "338", "625", "626", "627", "339", "628", "629", "630", "631", "632", "633", "634", "635", "113", "636", "637", "638", "639", "640", "641", "642", "397", "643", "644", "645", "646", "396", "647", "648", "110", "107", "649", "650", "651", "652", "653", "654", "655", "656", "657", "658", "659", "660", "661", "662", "663", "664", "665", "666", "667", "668", "669", "670", "671", "673", "674", "675", "676", "395", "677", "678", "394", "679", "680", "681", "682", "683", "684", "393", "103", "685", "686", "687", "688", "689", "703", "701", "697", "392", "391", "389", "390", "386"]
  site = "http://testingpodcast.com/"
  password = ARGV[0]
  browser = Watir::Browser.new :ff

  log_in(browser, site, password)
  post_numbers.each_with_index do |post_number, index|
    get_post_data(browser, site, post_number, index)
  end
end


