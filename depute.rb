require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_mail_deputes(url_page)

	doc = Nokogiri::HTML(open(url_page))
	doc.xpath('/html/body/div[3]/div/div/div/section[2]/div/div/div/article/div[4]/section/dl/dd[2]/a').text

end


def get_all_depute


	doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

	doc.css(".col3 li a").each do |link|
		
 		url_doc = "http://www2.assemblee-nationale.fr/" + link["href"].to_s  
		deputy_name = link.text
	
 		deputy_mail =  get_mail_deputes(url_doc)
		
 		contact = {:name => deputy_name, :email => deputy_mail}
 		
		puts  contact
		

	end

 end

puts get_all_depute