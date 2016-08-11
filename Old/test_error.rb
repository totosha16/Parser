# encoding: cp866

require 'nokogiri'
require 'open-uri'
require 'date'
require 'encoding'

def dateconvert text
	if text.length == 8
		return Date.strptime(text, '%d%m%Y')
	elsif text.length == 6
		return Date.strptime(text, '%d%m%y')
	end
end

def addtocsv url, price, date
	@f.write ("#{url};#{price};#{dateconvert(date).strftime("%d.%m.%y")};#{DateTime.now.strftime("%d.%m.%y")}\r")
	#@f.write ("#{url};#{price};#{dateconvert(date)};#{DateTime.now.}\r")
end


@f= File.new("error.csv", "a")


begin
url="http://capital-mett.com/cena-lom-chernyh-metallovs"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[3]/div/div[2]/div/div/div[1]/div[2]/table/tbody/tr[2]/td[2]/strong").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
rescue => e
	addtocsv url, e, '010101'
end



url="http://lomrus.ru/tseny-na-metallolom"
html = Nokogiri::HTML(open(url))

html.css("#print-content").each do |node|
	section_html = Nokogiri::HTML(node.inner_html)
	price=section_html.css('td')[5].text.gsub(/\D/,"").to_i
	pdate=html.css(".dali-postcontent h2").text.gsub(/\D/,"")
	addtocsv url, price, pdate
end

#//*[@id="print-content"]/table[1]/tbody/tr[2]/td[3]/p[5]/span
#//*[@id="node-58"]/article/div/div/h2
url="http://lomrus.ru/tseny-na-metallolom"
	html = Nokogiri::HTML(open(url))

	price=html.css("#print-content").xpath("table[1]/tbody/tr[2]/td[3]/p[5]/span").text.gsub(/\D/,"").to_i
	pdate=html.css("#node-58").xpath("article/div/div/h2").text.gsub(/\D/,"")

	addtocsv url, price, pdate



url="http://rosmet-lom.ru/"
	html = Nokogiri::HTML(open(url))

	price=html.css(".tab1 tbody tr")[1].css("td")[2].text.gsub(/\D/,"").to_i	
	pdate=html.css("#ceny").text.gsub(/\D/,"")
	addtocsv url, price, pdate




addtocsv "new day", 0, "010101"
	
@f.close
gets