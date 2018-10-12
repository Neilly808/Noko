require 'rubygems'
require 'nokogiri'
require 'open-uri'

while 1 == 1 do

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 

name_list = page.css('a.currency-name-container')
price_list = page.css('a.price') 
tab = Hash.new 

for i in 0 .. (name_list.length-1)
	tab[name_list[i].text] = [price_list[i]['data-usd']]
end

puts tab
puts "-----------------------------------------------------------------"
puts "--------------------sleeping 1h----------------------------------"
puts "-----------------------------------------------------------------"
sleep(3600)
end 