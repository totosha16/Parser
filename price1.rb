#require 'net/http'
require 'nokogiri'
require 'open-uri'

url="http://lomrus.ru/tseny-na-metallolom"

f= File.new("string.txt", "w")
html = Nokogiri::HTML(open(url))
html.css("#print-content").each do |node|
#	f1.write node
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


f.close


gets