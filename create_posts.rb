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
  [{:title=>"Episode 66 - Testing Strategies for a Toaster Pt.2",
  :number=>66,
  :url=>"http://codingqa.com/Episode-66-Testing-Strategies-for-a-Toaster-Pt-2",
  :date=>"Wednesday, 5 October 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/df7a4429-ddcc-441b-a4ed-7953f481eb54/Podcast.mp3"},
 {:title=>"Episode 65 - Testing Strategies for a Toaster",
  :number=>65,
  :url=>"http://codingqa.com/Episode-65-Testing-Strategies-for-a-Toaster",
  :date=>"Sunday, 25 September 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/3acc8435-7703-4409-a448-f5d5e5dedeb0/Podcast.mp3"},
 {:title=>"Episode 64 - What Do You Want To Hear?",
  :number=>64,
  :url=>"http://codingqa.com/Episode-64-What-Do-You-Want-To-Hear-",
  :date=>"Sunday, 11 September 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/3f38df97-57d0-49db-a755-c363f3f659bf/Podcast.mp3"},
 {:title=>"Episode 63 - Setup Testing",
  :number=>63,
  :url=>"http://codingqa.com/Episode-63-Setup-Testing",
  :date=>"Monday, 29 August 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/4ed66af3-8a15-464e-82cd-c12714491c0b/Podcast.mp3"},
 {:title=>"Episode 62 - Team Structure",
  :number=>62,
  :url=>"http://codingqa.com/Episode-62-Team-Structure",
  :date=>"Sunday, 21 August 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/4566df07-fc4f-40d4-ae41-c9732f1f16dc/Podcast.mp3"},
 {:title=>"Episode 61 - Accessibility Testing",
  :number=>61,
  :url=>"http://codingqa.com/Episode-61-Accessibility-Testing",
  :date=>"Saturday, 13 August 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/3f50f94b-0dc6-4ad9-9d9f-71ed59135ca6/Podcast.mp3"},
 {:title=>"Episode 60 - Fede and Atlassian (Part 2)",
  :number=>60,
  :url=>"http://codingqa.com/Episode-60-Fede-and-Atlassian-Part-2-",
  :date=>"Wednesday, 27 July 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/592c5f43-9c5d-5642-9d8a-419f3a2e1491/Podcast.mp3"},
 {:title=>"Episode 59 - Fede and Atlassian (Part 1)",
  :number=>59,
  :url=>"http://codingqa.com/Episode-59-Fede-and-Atlassian-Part-1-",
  :date=>"Thursday, 14 July 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/eb60267e-6d81-4480-949e-564decca239d/Podcast.mp3"},
 {:title=>"Episode 58 - Improving Test Team Morale",
  :number=>58,
  :url=>"http://codingqa.com/Episode-58-Improving-Test-Team-Morale",
  :date=>"Thursday, 7 July 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/81b91618-6643-40a2-97c6-45ddb9c5483a/Podcast.mp3"},
 {:title=>"Episode 57 - Optimal Test Automation",
  :number=>57,
  :url=>"http://codingqa.com/Episode-57-Optimal-Test-Automation",
  :date=>"Friday, 17 June 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/9e5fe76e-f3dd-4792-9dad-c4a881596da5/Podcast.mp3"},
 {:title=>"Episode 56 - Localization and Globalization",
  :number=>56,
  :url=>"http://codingqa.com/Episode-56-Localization-and-Globalization",
  :date=>"Wednesday, 1 June 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/d36b6e54-9a2d-4a7b-a74a-5defa3d25b63/Podcast.mp3"},
 {:title=>"Episode 55 - SDE vs. SDET, Scenario Focused Eng",
  :number=>55,
  :url=>"http://codingqa.com/Episode-55-SDE-vs-SDET-Scenario-Focused-Eng",
  :date=>"Friday, 13 May 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/e4a92fc2-2e97-4580-b5f6-7aa9dbd75cc0/Podcast.mp3"},
 {:title=>"Episode 54 - Interviewing at Microsoft",
  :number=>54,
  :url=>"http://codingqa.com/Episode-54-Interviewing-at-Microsoft",
  :date=>"Saturday, 23 April 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/8564e829-2db2-4cd3-88ea-79930dd78e96/Podcast.mp3"},
 {:title=>"Episode 53 - Tech Talks and Effective Testing",
  :number=>53,
  :url=>"http://codingqa.com/Episode-53-Tech-Talks-and-Effective-Testing",
  :date=>"Saturday, 2 April 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/c7c0e179-92cf-49b4-9527-6a38f7a2a6cd/Podcast.mp3"},
 {:title=>"Episode 52 - Testing - Done Differently",
  :number=>52,
  :url=>"http://codingqa.com/Episode-52-Testing-Done-Differently",
  :date=>"Monday, 14 March 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/38bb30d2-c99e-4fbd-99de-689e5010bffb/Podcast.mp3"},
 {:title=>"Episode 51 - New Owners and Test as Dev",
  :number=>51,
  :url=>"http://codingqa.com/Episode-51-New-Owners-and-Test-as-Dev",
  :date=>"Sunday, 6 March 2011",
  :mp3=>
   "http://codingqa.com/Home/Download/96984d7b-caa6-4240-b50c-b8f7b3b6d1b2/Podcast.mp3"},
 {:title=>"Episode 50 End of an Era",
  :number=>50,
  :url=>"http://codingqa.com/Episode-50-End-of-an-Era",
  :date=>"Monday, 1 November 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/ea5ca343-30c5-4489-9ed8-70feaeb28baa/Podcast.mp3"},
 {:title=>"Episode 45 Revisit Developer & Tester Roles",
  :number=>45,
  :url=>"http://codingqa.com/Episode-45-Revisit-Developer-Tester-Roles",
  :date=>"Monday, 11 October 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/43be2668-2cdc-4fe0-a306-5c6d4d3410bc/Podcast.mp3"},
 {:title=>"Episode 44 Bug Verification Checklist",
  :number=>44,
  :url=>"http://codingqa.com/Episode-44-Bug-Verification-Checklist",
  :date=>"Wednesday, 15 September 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/85db587d-91c3-47da-9c68-7fef19acb0ec/Podcast.mp3"},
 {:title=>"Episode 43 Black and White Box Testing",
  :number=>43,
  :url=>"http://codingqa.com/Episode-43-Black-and-White-Box-Testing",
  :date=>"Friday, 16 July 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/dacda9c4-60c7-4728-bde1-8002dd7830a4/Podcast.mp3"},
 {:title=>"Episode 42 Introducing WebMatrix",
  :number=>42,
  :url=>"http://codingqa.com/Episode-42-Introducing-WebMatrix",
  :date=>"Thursday, 8 July 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/3b29f0f7-5e71-4498-b8fe-d3743bee3661/Podcast.mp3"},
 {:title=>"Episode 41 iPhone TDD",
  :number=>41,
  :url=>"http://codingqa.com/Episode-41-iPhone-TDD",
  :date=>"Tuesday, 8 June 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/082a6e3c-196b-4de3-bddc-83e678f94681/Podcast.mp3"},
 {:title=>"Episode 40 Continuous Integration",
  :number=>40,
  :url=>"http://codingqa.com/Episode-40-Continuous-Integration",
  :date=>"Thursday, 27 May 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/e68b7bc7-72ff-4bc8-b501-4c2e89287d36/Podcast.mp3"},
 {:title=>"Episode 39 Product Metrics",
  :number=>39,
  :url=>"http://codingqa.com/Episode-39-Product-Metrics",
  :date=>"Monday, 10 May 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/ad6d70e9-dd11-4a9f-b9bc-360c5b43d3e9/Podcast.mp3"},
 {:title=>"Episode 38 Surviving the Corporate Jungle",
  :number=>38,
  :url=>"http://codingqa.com/Episode-38-Surviving-the-Corporate-Jungle",
  :date=>"Tuesday, 4 May 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/7e06331c-a280-4f7e-93f0-92f3cd0ff1a3/Podcast.mp3"},
 {:title=>"Episode 37 Installer Testing",
  :number=>37,
  :url=>"http://codingqa.com/Episode-37-Installer-Testing",
  :date=>"Sunday, 25 April 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/c1e241fd-9acf-42f3-98e5-d642782f4535/Podcast.mp3"},
 {:title=>"Episode 36 Damian Edwards on Real Testing",
  :number=>36,
  :url=>"http://codingqa.com/Episode-36-Damian-Edwards-on-Real-Testing",
  :date=>"Friday, 9 April 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/2b7afd06-9800-4b7c-8bd4-2e1b007ed7cf/Podcast.mp3"},
 {:title=>"Episode 35 Code Quality for Automated Tests",
  :number=>35,
  :url=>"http://codingqa.com/Episode-35-Code-Quality-for-Automated-Tests",
  :date=>"Friday, 2 April 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/5083156f-730d-450c-a741-d0e0d2830194/Podcast.mp3"},
 {:title=>"Episode 34 Testing Heuristics",
  :number=>34,
  :url=>"http://codingqa.com/Episode-34-Testing-Heuristics",
  :date=>"Thursday, 25 March 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/0386489c-b129-45ce-893e-725c2764977a/Podcast.mp3"},
 {:title=>"Episode 33 Team Structure",
  :number=>33,
  :url=>"http://codingqa.com/Episode-33-Team-Structure",
  :date=>"Tuesday, 2 March 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/1c44835c-6c80-45c9-937f-a02529a6ab65/Podcast.mp3"},
 {:title=>"Episode 32 Last Minute Changes",
  :number=>32,
  :url=>"http://codingqa.com/Episode-32-Last-Minute-Changes",
  :date=>"Friday, 29 January 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/c196f31d-fe40-4965-a18c-af50fc83e9af/Podcast.mp3"},
 {:title=>"Episode 31 The Vicious Cycle",
  :number=>31,
  :url=>"http://codingqa.com/Episode-31-The-Vicious-Cycle",
  :date=>"Friday, 15 January 2010",
  :mp3=>
   "http://codingqa.com/Home/Download/e5c35383-f810-452c-8740-dd68a8c97a8b/Podcast.mp3"},
 {:title=>"Episode 30 Pair Testing",
  :number=>30,
  :url=>"http://codingqa.com/Episode-30-Pair-Testing",
  :date=>"Sunday, 20 December 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/e80b7943-67c2-404f-b5c8-1ba8fb5edd18/Podcast.mp3"},
 {:title=>"Episode 29 Time Not Testing",
  :number=>29,
  :url=>"http://codingqa.com/Episode-29-Time-Not-Testing",
  :date=>"Friday, 4 December 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/56e0c7e3-25f6-4a72-a1be-c419378d02bd/Podcast.mp3"},
 {:title=>"Episode 28 Chatting with James Bach",
  :number=>28,
  :url=>"http://codingqa.com/Episode-28-Chatting-with-James-Bach",
  :date=>"Tuesday, 17 November 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/31309d71-30a4-4871-b145-833dac5ae12a/Podcast.mp3"},
 {:title=>"Episode 27 Unit Testing With Brad Wilson",
  :number=>27,
  :url=>"http://codingqa.com/Episode-27-Unit-Testing-With-Brad-Wilson",
  :date=>"Saturday, 31 October 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/0de9630a-230d-4ebf-bb8c-7b94dc1e90b7/Podcast.mp3"},
 {:title=>"Episode 26 Reducing Waste",
  :number=>26,
  :url=>"http://codingqa.com/Episode-26-Reducing-Waste",
  :date=>"Friday, 23 October 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/08f5ad8a-80bc-419e-ad2e-716108eb6834/Podcast.mp3"},
 {:title=>"Episode 25 Test Priorities",
  :number=>25,
  :url=>"http://codingqa.com/Episode-25-Test-Priorities",
  :date=>"Tuesday, 20 October 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/dc1de892-9e7e-4e01-82b3-6e5e9ea4e73d/Podcast.mp3"},
 {:title=>"Episode 24 Process Overhead",
  :number=>24,
  :url=>"http://codingqa.com/Episode-24-Process-Overhead",
  :date=>"Friday, 9 October 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/739ec86e-b8c3-4190-96cd-558c453a8a99/Podcast.mp3"},
 {:title=>"Episode 23 Port-a-Test a portable test bed",
  :number=>23,
  :url=>"http://codingqa.com/Episode-23-Port-a-Test-a-portable-test-bed",
  :date=>"Saturday, 26 September 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/72e25ce2-53d7-41c1-93c7-c03afe8f510b/Podcast.mp3"},
 {:title=>"Episode 22 Swatting Bugs",
  :number=>22,
  :url=>"http://codingqa.com/Episode-22-Swatting-Bugs",
  :date=>"Sunday, 20 September 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/04584be0-2e80-41cc-a3e1-1340436fe2a4/Podcast.mp3"},
 {:title=>"Episode 21 Agile Manifesto",
  :number=>21,
  :url=>"http://codingqa.com/Episode-21-Agile-Manifesto",
  :date=>"Saturday, 12 September 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/bfa9e4a6-e0ea-4382-9b9c-9134584ab260/Podcast.mp3"},
 {:title=>"Episode 20 Test Contexts",
  :number=>20,
  :url=>"http://codingqa.com/Episode-20-Test-Contexts",
  :date=>"Friday, 28 August 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/d4dfb989-3278-4682-8962-d3e19fb81f29/Podcast.mp3"},
 {:title=>"Episode 19 But QA is important too!",
  :number=>19,
  :url=>"http://codingqa.com/Episode-19-But-QA-is-important-too-",
  :date=>"Friday, 21 August 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/5cf2581a-310a-4c99-bba0-d50ff1663cb5/Podcast.mp3"},
 {:title=>"Episode 18 Would you like fries with that?",
  :number=>18,
  :url=>"http://codingqa.com/Episode-18-Would-you-like-fries-with-that-",
  :date=>"Friday, 14 August 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/32a995ee-4687-4e35-b20e-12def7124d56/Podcast.mp3"},
 {:title=>"Episode 17 MVC 2 Preview 1",
  :number=>17,
  :url=>"http://codingqa.com/Episode-17-MVC-2-Preview-1",
  :date=>"Friday, 7 August 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/045a001f-69d7-4d3d-8e37-05723155cae0/Podcast.mp3"},
 {:title=>"Episode 16 \"The Right Stuff\" to be Successful",
  :number=>16,
  :url=>"http://codingqa.com/Episode-16-The-Right-Stuff-to-be-Successful",
  :date=>"Friday, 24 July 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/8927b478-b7d0-4a2a-9c35-832f2ca288c4/Podcast.mp3"},
 {:title=>"Episode 15 Bug Review",
  :number=>15,
  :url=>"http://codingqa.com/Episode-15-Bug-Review",
  :date=>"Friday, 17 July 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/95cba8f1-6cda-4053-94c1-a71b8cbbe6f2/Podcast.mp3"},
 {:title=>"Episode 14 Charting with Lakshmi Padala",
  :number=>14,
  :url=>"http://codingqa.com/Episode-14-Charting-with-Lakshmi-Padala",
  :date=>"Friday, 10 July 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/7d109f26-e412-47aa-836c-a59b558c5525/Podcast.mp3"},
 {:title=>"Episode 13 Test Maintainability",
  :number=>13,
  :url=>"http://codingqa.com/Episode-13-Test-Maintainability",
  :date=>"Friday, 3 July 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/490ae9b9-530a-45bc-8cb3-1b3c946e986f/Podcast.mp3"},
 {:title=>"Episode 12 Jim Wang on Microsoft AJAX",
  :number=>12,
  :url=>"http://codingqa.com/Episode-12-Jim-Wang-on-Microsoft-AJAX",
  :date=>"Friday, 26 June 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/21ce4e25-ec6c-42d5-b6b9-e4add68b2d2b/Podcast.mp3"},
 {:title=>"Episode 11 Interviewing Hong Li",
  :number=>11,
  :url=>"http://codingqa.com/Episode-11-Interviewing-Hong-Li",
  :date=>"Friday, 19 June 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/7155e6b8-b7b0-4d0b-8336-4dec4bd86a10/Podcast.mp3"},
 {:title=>"Episode 10 Project Structure",
  :number=>10,
  :url=>"http://codingqa.com/Episode-10-Project-Structure",
  :date=>"Friday, 12 June 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/da45bd63-9fb0-44d7-adeb-894699f02661/Podcast.mp3"},
 {:title=>"Episode 9 Releasing a Product",
  :number=>9,
  :url=>"http://codingqa.com/Episode-9-Releasing-a-Product",
  :date=>"Friday, 5 June 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/85a185f8-b492-42c5-8017-6b7a9abff9c4/Podcast.mp3"},
 {:title=>"Episode 8 Testing, what is that?",
  :number=>8,
  :url=>"http://codingqa.com/Episode-8-Testing-what-is-that-",
  :date=>"Thursday, 28 May 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/61c53529-5382-4ded-91b5-0cfca9bc901b/Podcast.mp3"},
 {:title=>"Episode 7 A Tour Around Exploratory Testing",
  :number=>7,
  :url=>"http://codingqa.com/Episode-7-A-Tour-Around-Exploratory-Testing",
  :date=>"Friday, 22 May 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/66c34c9d-a4ee-4dc6-a76d-d5259eab292f/Podcast.mp3"},
 {:title=>"Episode 6",
  :number=>6,
  :url=>"http://codingqa.com/Episode-6",
  :date=>"Friday, 15 May 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/0d48acdc-8622-470c-abcd-aab913a1448c/Podcast.mp3"},
 {:title=>"Episode 5",
  :number=>5,
  :url=>"http://codingqa.com/Episode-5",
  :date=>"Friday, 8 May 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/3a658997-0619-44c4-80a7-7c306d5e0300/Podcast.mp3"},
 {:title=>"Episode 4",
  :number=>4,
  :url=>"http://codingqa.com/Episode-4",
  :date=>"Friday, 24 April 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/79b76679-4550-49bf-a012-65fa810f3c7c/Podcast.mp3"},
 {:title=>"Episode 3",
  :number=>3,
  :url=>"http://codingqa.com/Episode-3",
  :date=>"Friday, 24 April 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/10dc4bcf-87b1-422d-85cc-696621f8de15/Podcast.mp3"},
 {:title=>"Episode 2",
  :number=>2,
  :url=>"http://codingqa.com/Episode-2",
  :date=>"Friday, 24 April 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/1f4b9f75-f889-4a00-a905-c28b0531d2df/Podcast.mp3"},
 {:title=>"Episode 1",
  :number=>1,
  :url=>"http://codingqa.com/Episode-1",
  :date=>"Friday, 24 April 2009",
  :mp3=>
   "http://codingqa.com/Home/Download/ee6a70c3-4c2c-4f0f-891a-33fc1a2816d0/Podcast.mp3"}]
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