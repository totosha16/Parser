


#
#http://www.lombe.ru/tsena-metallolom/
#http://re-lom.ru/ceny-na-lom-metallov.html
#http://www.megaferum.ru/
#http://www.baltexcom.net/price.html
#http://uvchm.ru/prices/p-479/

#require 'net/http'
require 'nokogiri'
require 'open-uri'
require 'date'

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


@f= File.new("prices.csv", "w")

url="http://lomrus.ru/tseny-na-metallolom"
html = Nokogiri::HTML(open(url))

html.css("#print-content").each do |node|
	section_html = Nokogiri::HTML(node.inner_html)
	price=section_html.css('td')[5].text.gsub(/\D/,"").to_i
	pdate=html.css(".dali-postcontent h2").text.gsub(/\D/,"")
	addtocsv url, price, pdate
end

url="http://rosmet-lom.ru/"
	html = Nokogiri::HTML(open(url))

	price=html.css(".tab1 tbody tr")[1].css("td")[2].text.gsub(/\D/,"").to_i	
	pdate=html.css("#ceny").text.gsub(/\D/,"")
	addtocsv url, price, pdate
	
url="http://lomvtormet.ru/cjeny"
	html = Nokogiri::HTML(open(url))

	price=html.css(".tbl")[0].css(".second").css(".r")[2].text.gsub(/\D/,"").to_i
	pdate=html.css(".c_block").css(".text")[3].text.gsub(/\D/,"")
	# by xpath: pdate=html.xpath("html/body/div/div/div/table")[3].text.gsub(/\D/,"")
	# full_true path: f.write html.xpath("html/body/div/div/div/table")[3].xpath("tr/td/p")[2].text.gsub(/\D/,"")
	addtocsv url, price, pdate

url="http://www.startmetall.ru/price/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#post-3").xpath("div/table[2]/tbody/tr[56]/td[2]").text.gsub(/\D/,"").to_i*1000
	#//*[@id="post-3"]/div/table[1]/tbody/tr/td[2]/em/span
	pdate=html.css("#post-3").xpath("div/table[1]/tbody/tr/td[2]/em/span").text.gsub(/\D/,"")
	addtocsv url, price, pdate
	
url="http://planetaloma.ru/tseny"
	html = Nokogiri::HTML(open(url))

	price=html.css("#container_wrap").xpath("div/div/div[3]/table[1]/tbody/tr[2]/td[3]").text.gsub(/\D/,"").to_i
	pdate=html.css("#container_wrap").xpath("div/div/div[3]/h2[1]/span").text.gsub(/\D/,"")
	addtocsv url, price, pdate	
	
url="http://kupim-metall.ru/tseny-0"
	html = Nokogiri::HTML(open(url))

	price=html.css("#node-79").xpath("article/div/div/table[1]/tbody/tr[2]/td[2]/p[10]/span/strong").text.gsub(/\D/,"").to_i
	pdate=html.css("#node-79").xpath("article/div/div/h2[1]").text.gsub(/\D/,"")
	addtocsv url, price, pdate		
	
url="http://metalloplus.ru/tsena/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#motopress-main").xpath("div[3]/div/div/div/table[2]/tbody/tr[2]/td[3]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate			

url="http://orisprom.ru/purchase/ceny_na_lom_i_othody_chernyh_metallov"
	html = Nokogiri::HTML(open(url))
	pdate=html.css("#mainContent").xpath("div/p[2]/span/span").text.gsub(/\D/,"")

	url="http://orisprom.ru/purchase/ceny_na_lom_i_othody_chernyh_metallov/tec-21/"	
	html = Nokogiri::HTML(open(url))
	price=html.css("#mainContent").xpath("div/table[2]/tbody/tr[1]/td[4]").text.gsub(/\D/,"").to_i
	addtocsv url, price, pdate		
	
	url="http://orisprom.ru/purchase/ceny_na_lom_i_othody_chernyh_metallov/proizvodstvennaya_baza_gdzerzhinskij/"
	html = Nokogiri::HTML(open(url))
	price=html.css("#mainContent").xpath("div/table[2]/tbody/tr[1]/td[4]").text.gsub(/\D/,"").to_i
	addtocsv url, price, pdate		
	
	url="http://orisprom.ru/purchase/ceny_na_lom_i_othody_chernyh_metallov/tec-26/"
	html = Nokogiri::HTML(open(url))
	price=html.css("#mainContent").xpath("div/table[2]/tbody/tr[1]/td[4]").text.gsub(/\D/,"").to_i
	addtocsv url, price, pdate	
	
@f.close
gets