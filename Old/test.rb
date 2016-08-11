require 'nokogiri'
require 'open-uri'

#f= File.new("test.txt", "w")

#url="http://vtormetlom.ctlx.ru/"
#html = Nokogiri::HTML(open(url))
#f.write	html.css("#index_page_products_block").xpath("div[1]/table/tbody/tr[1]/td[1]/div[1]/div[2]/span").text.gsub(/\D/,"").to_i



url="http://rosmet-lom.ru/"
	html = Nokogiri::HTML(open(url))


	#price=html.css(".tab1 tbody tr[2]").css("td[3]").text.gsub(/\D/,"").to_i	
	price=html.css("#1436347524131-4-2")
	price=price.xpath("div[2]/div/div/table/tbody/tr[2]/td[3]").text.gsub(/\D/,"").to_i
	pdate=html.css("#ceny").text.gsub(/\D/,"")

	puts url, price, pdate



gets

#html = Nokogiri::HTML(open(url))  

	
	#price=html.css(".tab1 tbody tr")[1].css("td")[2].text.gsub(/\D/,"").to_i	
	#pdate=html.css("#ceny").text.gsub(/\D/,"")





#url="http://lomvtormet.ru/cjeny"
#	html = Nokogiri::HTML(open(url))
#	price=html.css(".tbl")[0].css(".second").css(".r")[2].text.gsub(/\D/,"").to_i
#	pdate=html.css(".c_block").css(".text")[3].text.gsub(/\D/,"")


#f.close






