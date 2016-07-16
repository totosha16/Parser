

#require 'net/http'
require 'nokogiri'
require 'open-uri'

url="http://lomrus.ru/tseny-na-metallolom"

f1= File.new("all.txt", "w")
f2= File.new("string.txt", "w")

html = Nokogiri::HTML(open(url))
h2=html.css(".dali-postcontent h2").text.gsub(/\D/,"")
	f1.write h2



f1.close
f2.close


gets