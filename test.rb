require 'nokogiri'
require 'open-uri'




url="http://old-metall.ru/czenyi"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div/div[4]/table[1]/tbody/tr[2]/td[3]").text.gsub(/\D/,"").to_i/100
	pdate="010101"
	
	

	puts url, price, pdate



gets

