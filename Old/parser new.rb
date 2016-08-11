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



begin
url="http://lomrus.ru/tseny-na-metallolom"
	html = Nokogiri::HTML(open(url))

	price=html.css("#print-content").xpath("table[1]/tbody/tr[2]/td[3]/p[5]/span").text.gsub(/\D/,"").to_i
	pdate=html.css("#node-58").xpath("article/div/div/h2").text.gsub(/\D/,"")
	addtocsv url, price, pdate
rescue => e
	addtocsv url, e, '010101'
end

begin
url="http://rosmet-lom.ru/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#1436347524131-4-2").xpath("div[2]/div/div/table/tbody/tr[2]/td[3]").text.gsub(/\D/,"").to_i
	pdate=html.css("#ceny").text.gsub(/\D/,"")
	addtocsv url, price, pdate
rescue => e
	addtocsv url, e, '010101'
end

begin
url="http://www.startmetall.ru/price/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#post-3").xpath("div/table[2]/tbody/tr[56]/td[2]").text.gsub(/\D/,"").to_i*1000
	pdate=html.css("#post-3").xpath("div/table[1]/tbody/tr/td[2]/em/span").text.gsub(/\D/,"")
	addtocsv url, price, pdate
rescue => e
	addtocsv url, e, '010101'
end

begin
url="http://planetaloma.ru/tseny"
	html = Nokogiri::HTML(open(url))

	price=html.css("#container_wrap").xpath("div/div/div[3]/table[1]/tbody/tr[2]/td[3]").text.gsub(/\D/,"").to_i
	pdate=html.css("#container_wrap").xpath("div/div/div[3]/h2[1]/span").text.gsub(/\D/,"")
	addtocsv url, price, pdate	
rescue => e
	addtocsv url, e, '010101'
end

begin
url="http://kupim-metall.ru/tseny-0"
	html = Nokogiri::HTML(open(url))

	price=html.css("#node-79").xpath("article/div/div/table[1]/tbody/tr[2]/td[2]/p[10]/span/strong").text.gsub(/\D/,"").to_i
	pdate=html.css("#node-79").xpath("article/div/div/h2[1]").text.gsub(/\D/,"")
	addtocsv url, price, pdate		
rescue => e
	addtocsv url, e, '010101'
end

begin
url="http://metalloplus.ru/tsena/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#motopress-main").xpath("div[3]/div/div/div/table[2]/tbody/tr[2]/td[3]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate			
rescue => e
	addtocsv url, e, '010101'
end

#Начало сложного куска
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
#Конец сложного куска	

begin	
url="http://www.reallom.ru/price/price-chermet"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content").xpath("div[1]/div/div[2]/div[2]/table/tbody/tr[4]/td[3]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate
rescue => e
	addtocsv url, e, '010101'
end

begin
url="http://sdaylom.ru/priem-loma-v-moskve"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content").xpath("div[2]/div[1]/div[1]/div/table[1]/tbody/tr[2]/td[3]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate
rescue => e
	addtocsv url, e, '010101'
end

begin
url="http://prioritetmet.ru/ceni-na-metall"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content_inner").xpath("table[3]/tbody/tr[2]/td[4]/p/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
rescue => e
	addtocsv url, e, '010101'
end

begin
url="http://old-metall.ru/czenyi"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div/div[4]/table[1]/tbody/tr[2]/td[3]").text.gsub(/\D/,"").to_i/100
	pdate="010101"
	addtocsv url, price, pdate		
rescue => e
	addtocsv url, e, '010101'
end

begin
url="http://pmk-lom.ru/purchase/prices/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#column-right").xpath("div/div[2]/table/tbody/tr[2]/td[3]/p").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
rescue => e
	addtocsv url, e, '010101'
end

begin
url="http://www.lom-msk.ru/cherniy/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content_bg").xpath("div[1]/div[2]/div/table/tbody/tr[2]/td[4]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate
rescue => e
	addtocsv url, e, '010101'
end

begin
url="http://lompriem.ru/vse-nashi-tseny.html"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[2]/div[4]/div[2]/div/table/tbody/tr[47]/td[3]/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate

begin
url="http://foramet.ru/chernyj-metall"
	html = Nokogiri::HTML(open(url))

	price=html.css(".MsoTable15Plain2").xpath("tr[2]/td[2]/p/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate

begin
url="http://www.lom-trade.ru/chernyj-metall.shtml"
	html = Nokogiri::HTML(open(url))

	price=html.css("#node-48").xpath("div/table/tbody/tr[1]/td[2]").text.gsub(/\D/,"").to_i*1000
	pdate="010101"
	addtocsv url, price, pdate

begin
url="http://lomrf.ru/price.htm"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content-wrap").xpath("div[2]/table[1]/tbody/tr[1]/td[2]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate

begin
url="http://metal-scrap.ru/chernyy-metallolom/lom-stali"
	html = Nokogiri::HTML(open(url))

	price=html.css(".item-214.active").text.gsub(/\D/,"").to_i*1000
	pdate="010101"
	addtocsv url, price, pdate	

begin
url="http://pzka.ru/punkt-priema-loma-chernykh-metallov/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#post-2").xpath("div[3]/div[2]/table/tbody/tr[4]/td[5]").text.gsub(/\D/,"").to_i/100
	pdate="010101"
	addtocsv url, price, pdate

begin
url="http://www.scrapmetall.ru/price.html"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/main/div[2]/div[1]/table/tbody/tr[2]/td[4]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	

begin
url="http://metall77.ru/ceny/"
	html = Nokogiri::HTML(open(url))

	price=html.css(".tb_price").xpath("tr[3]/td[3]").text.partition("-")[2]
	pdate="010101"
	addtocsv url, price, pdate

begin
url="http://www.priem-metalla.ru/pages/3/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#content-wraper").xpath("table[3]/tbody/tr[59]/td[2]/span").text.gsub(/\D/,"").to_i*1000
	pdate="010101"
	addtocsv url, price, pdate	
	
begin
url="http://www.lom-mira.ru/?yclid=3205156684406459317#!blank/ngcw6"
	html = Nokogiri::HTML(open(url))

	price=html.css("#comp-ihwh6uzs").xpath("h6[1]/span/span/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate		
	
begin
url="http://kuplu-metallolom.ru/pokupka-metalloloma-cena.html"
	html = Nokogiri::HTML(open(url))

	price=html.css("#art-main").xpath("div/div/div/div/div[2]/div[2]/div/div/article[9]/div/div/center/table/tbody/tr[2]/td[2]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	

begin
url="http://metallokonstruction.ru/ceni-na-metallolom.html"
	html = Nokogiri::HTML(open(url))

	price=html.css("#dle-content").xpath("table/tbody/tr[2]/td[4]/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	

begin
url="http://www.lombe.ru/tsena-metallolom/"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[1]/div/div/div/div[2]/div[2]/div/div[1]/table/tbody/tr[2]/td[2]/pre/span/span").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	

begin
url="http://re-lom.ru/ceny-na-lom-metallov.html"
	html = Nokogiri::HTML(open(url))

	price=html.css("#dle-content").xpath("div[2]/table[1]/tbody/tr[2]/td[4]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
begin
url="http://sdaymetall.ru/chernyj-metall.html"
	html = Nokogiri::HTML(open(url))

	price=html.css("#s-black-price").xpath("div/div/div[2]/table/tbody/tr[1]/td[2]/p[2]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
begin
url="http://www.megaferum.ru/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#dle-content").xpath("div/table[1]/tr[3]/td[4]").text.gsub(/\D/,"").to_i
	pdate=html.css("#dle-content").xpath("div/table[1]/tr[1]").text.gsub(/\D/,"")
	addtocsv url, price, pdate	
	
begin
url="http://glavchermet.ru/price.html?id=264"
	html = Nokogiri::HTML(open(url))

	price=html.css("#component").xpath("div/div[1]/table/tbody/tr[3]/td[4]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
begin
url="http://pro-lom.ru/kinds-scrap/?yclid=3206104835139308661"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[1]/div[1]/div/div[1]/section/table/tbody/tr[2]/td[4]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
begin
url="http://www.baltexcom.net/price.html"
	html = Nokogiri::HTML(open(url))

	price=html.css("#column-center").xpath("div[2]/table/tbody/tr[4]/td[1]/table/tbody/tr[9]/td[3]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
begin
url="http://www.icvtormet.ru/ru/produkciya-i-uslugi/departament-chernyh-metallov/zakupki/"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[1]/div[4]/div[2]/div/div[3]/div/div/div/table/tr/td[2]/table/tr[1]").css(".extraPrice").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
begin
url="http://uvchm.ru/prices/p-479/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#price_list").xpath("table/tbody/tr[8]/td[2]").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
begin
url="http://p-lom.ru/price_black.php"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[3]/div/div/ul[1]/li[3]/div[1]/p[2]/text()").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
begin
url="http://capital-mett.com/cena-lom-chernyh-metallov"
	html = Nokogiri::HTML(open(url))

	price=html.xpath("html/body/div[3]/div/div[2]/div/div/div[1]/div[2]/table/tbody/tr[2]/td[2]/strong").text.gsub(/\D/,"").to_i
	pdate="010101"
	addtocsv url, price, pdate	
	
begin
url="http://vtormetlom.ctlx.ru/"
	html = Nokogiri::HTML(open(url))

	price=html.css("#index_page_products_block").xpath("div[1]/table/tr[1]/td[1]/div[1]/div[2]/span").text.gsub(/\D/,"").to_i/100
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