require 'nokogiri'
require 'open-uri'

url="http://rosmet-lom.ru/"
html = Nokogiri::HTML(open(url))

f0= File.new("all.txt", "w")
f1= File.new("step1.txt", "w")
f2= File.new("step2.txt", "w")
f3= File.new("step3.txt", "w")


f2.write html.css(".tab1 tbody tr")[1].css("td")[2].text.gsub(/\D/,"").to_i
#f2.write html.xpath("@0x148bd6c").text
f3.write html.at_css(".tab1 tbody").inspect

html.css(".tab1 tbody").each do |part|
	f0.write part
	
#	section_html = Nokogiri::HTML(node.inner_html)


	price = part.at_css('td').text#.gsub(/\D/,"").to_i
	f1.write price
#	price.each do |qq|
#	f.write qq
#	end

#	f.write "#{url}, #{price}\r"

end



f0.close
f1.close
f2.close
f3.close

gets