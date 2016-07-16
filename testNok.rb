require 'nokogiri'
require 'open-uri'

url="http://lomrus.ru/tseny-na-metallolom"
html = Nokogiri::HTML(open(url))

#f0= File.new("all.txt", "w")
f= File.new("string.txt", "w")
f1= File.new("all.txt", "w")

html.css("#print-content").each do |node|
	f1.write node
	section_html = Nokogiri::HTML(node.inner_html)

	price = section_html.css('td')[5].text.gsub(/\D/,"").to_i
	date = html.css(".dali-postcontent h2").text.gsub(/\D/,"")
	
	f.write "#{url}, #{price}, #{date}\r"
	
end
f.close
gets