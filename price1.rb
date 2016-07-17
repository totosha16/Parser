
#http://www.startmetall.ru/price/
#http://planetaloma.ru/tseny
#http://lomvtormet.ru/cjeny
#http://kupim-metall.ru/tseny-0
#http://metalloplus.ru/tsena/
#http://orisprom.ru/purchase/ceny_na_lom_i_othody_chernyh_metallov
#http://www.lombe.ru/tsena-metallolom/
#http://re-lom.ru/ceny-na-lom-metallov.html
#http://www.megaferum.ru/
#http://www.baltexcom.net/price.html
#http://uvchm.ru/prices/p-479/


#require 'net/http'
require 'nokogiri'
require 'open-uri'

url="http://lomrus.ru/tseny-na-metallolom"

f= File.new("string.txt", "w")

html = Nokogiri::HTML(open(url))

html.css("#print-content").each do |node|
	section_html = Nokogiri::HTML(node.inner_html)

	f.write "#{url}, #{section_html.css('td')[5].text.gsub(/\D/,"").to_i}, #{html.css(".dali-postcontent h2").text.gsub(/\D/,"")}\r"

#	f.write url
#	f.write ", "
#	f.write section_html.css('td')[5].text.gsub(/\D/,"").to_i
#	f.write ", "
#	f.write html.css(".dali-postcontent h2").text.gsub(/\D/,"")
#	f.write "\r"

end


url="http://rosmet-lom.ru/"

	html = Nokogiri::HTML(open(url))

	f.write url
	f.write ", "	
	f.write html.css(".tab1 tbody tr")[1].css("td")[2].text.gsub(/\D/,"").to_i
	f.write ", "
	f.write html.css("#ceny").text.gsub(/\D/,"")
	f.write "\r"



url="http://lomvtormet.ru/cjeny"

	html = Nokogiri::HTML(open(url))

	f.write url
	f.write ", "	
	f.write html.css(".tbl")[0].css(".second").css(".r")[2].text.gsub(/\D/,"").to_i
	f.write ", "
	f.write html.css(".c_block").css(".text")[3].text.gsub(/\D/,"")
	f.write "\r"


f.close


gets