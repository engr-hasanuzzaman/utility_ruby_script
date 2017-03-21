# Load the Watir WebDriver
require 'watir'
user_name = 'hasanuzzaman@nascenia.com'
password = '284sumon'
 
# Create a new browser window
browser = Watir::Browser.new(:firefox)
 
# Navigate to the landingpage
browser.goto 'https://www.google.com/'
MENU_NAME = %W(Home Open-Source Blog) 

# Locate the email form field and enter the email address
# unless browser.text.include? 'Logout'
#   puts "------------ with in login browser------------"
#   puts "found button #{browser.a(:class => 'btn')}"
#   # Click the button
#   browser.a(:class => 'btn').click if browser.button(:class => 'btn')
#   sleep(2)
#   browser.text_field(:id => 'Email').set user_name
#   browser.input(:id => 'next').click
#   sleep(2)	  
#   browser.text_field(:id => 'Passwd').set password 
#   browser.input(:id => 'signIn').click
 
#   #with in timetracker 
#   if browser.a(:id => 'in').enabled?
#     	browser.a(:id => 'in').click
#   end	
	
# end
browser = Watir::Browser.new(:firefox)
browser.goto 'https://www.google.com/'
browser.link(text: 'Gmail').wait_until_present.click
sleep(10)
browser.back
sleep(10)

puts 'work end'
 
# Validate the response
#browser.text.include? 'Thank you'

# Will start Chrome
#browser = Watir::Browser.new
 
# Will start Firefox
#browser = Watir::Browser.new :firefox
 
# Will start Internet Explorer
#browser = Watir::Browser.new :ie
