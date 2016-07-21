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


@f= File.new("prices.csv", "a")

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
	
url="http://www.reallom.ru/price/price-chermet"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content").xpath("div[1]/div/div[2]/div[2]/table/tbody/tr[4]/td[3]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate

url="http://sdaylom.ru/priem-loma-v-moskve"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content").xpath("div[2]/div[1]/div[1]/div/table[1]/tbody/tr[2]/td[3]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate


url="http://prioritetmet.ru/ceni-na-metall"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content_inner").xpath("table[3]/tbody/tr[2]/td[4]/p/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	

url="http://old-metall.ru/czenyi"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div/div[4]/table[1]/tbody/tr[2]/td[3]").text.gsub(/\D/,"").to_i/100
	pdate="010101"
	addtocsv url, price, pdate		


url="http://pmk-lom.ru/purchase/prices/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#column-right").xpath("div/div[2]/table/tbody/tr[2]/td[3]/p").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	

url="http://www.lom-msk.ru/cherniy/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content_bg").xpath("div[1]/div[2]/div/table/tbody/tr[2]/td[4]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate

url="http://lompriem.ru/vse-nashi-tseny.html"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[2]/div[4]/div[2]/div/table/tbody/tr[47]/td[3]/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate

url="http://foramet.ru/chernyj-metall"
	html = Nokogiri::HTML(open(url))

	price=html.css(".MsoTable15Plain2").xpath("tr[2]/td[2]/p/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate


url="http://www.lom-trade.ru/chernyj-metall.shtml"
	html = Nokogiri::HTML(open(url))

	price=html.css("#node-48").xpath("div/table/tbody/tr[1]/td[2]").text.gsub(/\D/,"").to_i*1000
	pdate="010101"
	addtocsv url, price, pdate

	
url="http://lomrf.ru/price.htm"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content-wrap").xpath("div[2]/table[1]/tbody/tr[1]/td[2]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate

	
url="http://metal-scrap.ru/chernyy-metallolom/lom-stali"
	html = Nokogiri::HTML(open(url))

	price=html.css(".item-214.active").text.gsub(/\D/,"").to_i*1000
	pdate="010101"
	addtocsv url, price, pdate	


url="http://pzka.ru/punkt-priema-loma-chernykh-metallov/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#post-2").xpath("div[3]/div[2]/table/tbody/tr[4]/td[5]").text.gsub(/\D/,"").to_i/100
	pdate="010101"
	addtocsv url, price, pdate

url="http://www.scrapmetall.ru/price.html"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/main/div[2]/div[1]/table/tbody/tr[2]/td[4]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
url="http://metall77.ru/ceny/"
	html = Nokogiri::HTML(open(url))

	price=html.css(".tb_price").xpath("tr[3]/td[3]").text#.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate


url="http://www.priem-metalla.ru/pages/3/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content-wraper").xpath("table[3]/tbody/tr[59]/td[2]/span").text.gsub(/\D/,"").to_i*1000
	pdate="010101"
	addtocsv url, price, pdate	
	

url="http://www.lom-mira.ru/?yclid=3205156684406459317#!blank/ngcw6"
	html = Nokogiri::HTML(open(url))

	price=html.css("#comp-ihwh6uzs").xpath("h6[1]/span/span/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate		
	

url="http://kuplu-metallolom.ru/pokupka-metalloloma-cena.html"
	html = Nokogiri::HTML(open(url))

	price=html.css("#art-main").xpath("div/div/div/div/div[2]/div[2]/div/div/article[9]/div/div/center/table/tbody/tr[2]/td[2]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	



url="http://metallokonstruction.ru/ceni-na-metallolom.html"
	html = Nokogiri::HTML(open(url))

	price=html.css("#dle-content").xpath("table/tbody/tr[2]/td[4]/span/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	


url="http://www.lombe.ru/tsena-metallolom/"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[1]/div/div/div/div[2]/div[2]/div/div[1]/table/tbody/tr[2]/td[2]/pre/span/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	


#//*[@id="dle-content"]/div[2]/table[1]/tbody/tr[2]/td[4]!!!http://re-lom.ru/ceny-na-lom-metallov.html
url="http://re-lom.ru/ceny-na-lom-metallov.html"
	html = Nokogiri::HTML(open(url))

	price=html.css("#dle-content").xpath("div[2]/table[1]/tbody/tr[2]/td[4]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
#//*[@id="s-black-price"]/div/div/div[2]/table/tbody/tr[1]/td[2]/p[2]!!!http://sdaymetall.ru/chernyj-metall.html
url="http://sdaymetall.ru/chernyj-metall.html"
	html = Nokogiri::HTML(open(url))

	price=html.css("#s-black-price").xpath("div/div/div[2]/table/tbody/tr[1]/td[2]/p[2]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
#//*[@id="dle-content"]/div/table[1]/tbody/tr[3]/td[4]!!!http://www.megaferum.ru/
url="http://www.megaferum.ru/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#dle-content").xpath("div/table[1]/tbody/tr[3]/td[4]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
#//*[@id="component"]/div/div[1]/table/tbody/tr[3]/td[4]!!!http://glavchermet.ru/price.html?id=264
url="http://glavchermet.ru/price.html?id=264"
	html = Nokogiri::HTML(open(url))

	price=html.css("#component").xpath("div/div[1]/table/tbody/tr[3]/td[4]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
#/html/body/div[1]/div[1]/div/div[1]/section/table/tbody/tr[2]/td[4]!!!http://pro-lom.ru/kinds-scrap/?yclid=3206104835139308661
url="http://pro-lom.ru/kinds-scrap/?yclid=3206104835139308661"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[1]/div[1]/div/div[1]/section/table/tbody/tr[2]/td[4]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
#//*[@id="column-center"]/div[2]/table/tbody/tr[4]/td[1]/table/tbody/tr[9]/td[3]!!!http://www.baltexcom.net/price.html
url="http://www.baltexcom.net/price.html"
	html = Nokogiri::HTML(open(url))

	price=html.css("#column-center").xpath("div[2]/table/tbody/tr[4]/td[1]/table/tbody/tr[9]/td[3]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
#/html/body/div[1]/div[4]/div[2]/div/div[3]/div/div/div/table/tbody/tr/td[2]/table[2]/tbody/tr[1]/td[2]/div[1]!!!http://www.icvtormet.ru/ru/produkciya-i-uslugi/departament-chernyh-metallov/zakupki/
url="http://www.icvtormet.ru/ru/produkciya-i-uslugi/departament-chernyh-metallov/zakupki/"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[1]/div[4]/div[2]/div/div[3]/div/div/div/table/tbody/tr/td[2]/table[2]/tbody/tr[1]/td[2]/div[1]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
#//*[@id="price_list"]/table/tbody/tr[8]/td[2]!!!http://uvchm.ru/prices/p-479/
url="http://uvchm.ru/prices/p-479/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#price_list").xpath("table/tbody/tr[8]/td[2]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
#/html/body/div[3]/div/div/ul[1]/li[3]/div[1]/p[2]/text()!!!http://p-lom.ru/price_black.php
url="http://p-lom.ru/price_black.php"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[3]/div/div/ul[1]/li[3]/div[1]/p[2]/text()").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
#/html/body/div[3]/div/div[2]/div/div/div[1]/div[2]/table/tbody/tr[2]/td[2]/strong!!!http://capital-mett.com/cena-lom-chernyh-metallov
url="http://capital-mett.com/cena-lom-chernyh-metallov"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[3]/div/div[2]/div/div/div[1]/div[2]/table/tbody/tr[2]/td[2]/strong").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
#//*[@id="positions"]/table/tbody/tr[5]/td[2]/div[1]/div[2]/span!!!http://vtormetlom.ctlx.ru/
url="http://vtormetlom.ctlx.ru/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#positions").xpath("table/tbody/tr[5]/td[2]/div[1]/div[2]/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	


	
#url="http://SAMPLE"
#	html = Nokogiri::HTML(open(url))
#
#	price=html.css("#node-79").xpath("article/div/div/table[1]/tbody/tr[2]/td[2]/p[10]/span/strong").text.gsub(/\D/,"").to_i
#	pdate=html.css("#node-79").xpath("article/div/div/h2[1]").text.gsub(/\D/,"")
#	addtocsv url, price, pdate	

addtocsv "new day", 0, "010101"
	
@f.close
gets