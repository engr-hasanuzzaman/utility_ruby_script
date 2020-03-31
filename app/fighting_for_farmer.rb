# Load the Watir WebDriver
require 'watir'
user_name = 'hasanuzzaman@nascenia.com'
password = '284sumon'
 
# Create a new browser window
browser = Watir::Browser.new(:chrome)
 
# Navigate to the landingpage
browser.goto 'https://www.seedstarsworld.com/summit/voting/?fbclid=IwAR2PzpygH4Yetjy39QUMxX4RBJDiiCJqSnhHS80m26orijfzek6MW2nirwM'
 
# Locate the vote button
if browser.div(text: /iFarmer/).present?
  puts "-----fount the ifarmer on the list"
else
  puts "----ops did not found the ifarmer on the list"
end
# puts "found button #{browser.a(:class => 'btn')}"
# Click the button
# browser.a(:class => 'btn').click if browser.button(:class => 'btn')
# sleep(2)
# browser.text_field(:id => 'Email').set user_name
# browser.input(:id => 'next').click
# sleep(2)	  
# browser.text_field(:id => 'Passwd').set password 
# browser.input(:id => 'signIn').click

# #with in timetracker 
# if browser.a(:id => 'in').enabled?
#     browser.a(:id => 'in').click
# end	


puts 'work end'
 
# Validate the response
#browser.text.include? 'Thank you'

# Will start Chrome
#browser = Watir::Browser.new
 
# Will start Firefox
#browser = Watir::Browser.new :firefox
 
# Will start Internet Explorer
#browser = Watir::Browser.new :ie
