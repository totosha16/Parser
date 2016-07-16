#require 'net/http'
require 'nokogiri'
require 'open-uri'

url="http://lomrus.ru/tseny-na-metallolom"
f1= File.new("all.txt", "w")
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

end


url="http://rosmet-lom.ru/"
#f1= File.new("all.txt", "w")

#html = Nokogiri::HTML(open(url))
#html.css(".ceny").each do |node|
#	f1.write node
	html = Nokogiri::HTML(open(url))




	html.css(".tab1").each do |node|
	f1.write node
	section_html = Nokogiri::HTML(node.inner_html)
	block=section_html.css('td')[1].text
#	w=section_html.css('td')[1].text.gsub(/\D/,"").to_i
end
#	w="4343"
	f.write block







	f.write url
	f.write ", "
	f.write html.css("#ceny").text.gsub(/\D/,"")

#	f.write ", "
#	f.write html.css(".dali-postcontent h2").text.gsub(/\D/,"")
#end







f1.close
f.close


gets