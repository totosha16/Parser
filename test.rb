require 'nokogiri'
require 'open-uri'

f= File.new("test.txt", "w")



url="http://metall77.ru/ceny/"
	html = Nokogiri::HTML(open(url))

f.write html.css(".tb_price").xpath("tr[3]/td[3]").text#.gsub(/\D/,"").to_i
		
		
		
	
f.close



