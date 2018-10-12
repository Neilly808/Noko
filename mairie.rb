require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage(url)

	doc = Nokogiri::HTML(open(url))
	doc.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

end


def get_all_the_urls_of_val_doise_townhalls
	
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.css(".lientxt").each do |link|
		url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
		town_name = link.text
		town_email = get_the_email_of_a_townhal_from_its_webpage(url)
		town = {:name => town_name, :email => town_email}
		puts  town

	end

end

puts get_all_the_urls_of_val_doise_townhalls