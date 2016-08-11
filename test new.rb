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
	begin
		@output.write ("#{url};#{price};#{dateconvert(date).strftime("%d.%m.%y")};#{DateTime.now.strftime("%d.%m.%y")}\r")
	rescue
		@output.write ("#{url};#{price};#{date};#{DateTime.now.strftime("%d.%m.%y")}\r")
	end
end

def surgery opt
		puts "перед surgery"
		puts opt.inspect
	begin
		html = Nokogiri::HTML(open(opt[:url]))

		@price=nil
		@pdate=nil

		@price=html.css(opt[:cssP]) if opt[:cssP]
		if opt[:xpathP] && @price
			@price=@price.xpath(opt[:xpathP]).text.gsub(/\D/,"").to_i*opt[:kP]
			@price=@price.round
		elsif
			@price=html.xpath(opt[:xpathP]).text.gsub(/\D/,"").to_i*opt[:kP]
			@price=@price.round
		else
			@price='Path Error'
		end
		
		@pdate=html.css(opt[:cssD]) if opt[:cssD]
		if opt[:xpathD] && @pdate
			@pdate=@pdate.xpath(opt[:xpathD]).text.gsub(/\D/,"")
		elsif opt[:xpathD]
			@pdate=html.xpath(opt[:xpathD]).text.gsub(/\D/,"")
		else
			@pdate='Unknown date'
		end
		puts "после surgery, нет ошибок"
		puts opt.inspect
	rescue
			puts "ошибка в surgery"
			puts opt.inspect		
			@price='Page open Error'
			@pdate='Unknown date'
	end

end


#@output= File.new "prices.csv", "a"
#input = File.open "input.csv", "r"
input = File.open "input_test.csv", "r"


while (line = input.gets)
	arr=line.strip.split(';')
	data={:url=>arr[0],
		:cssP=>arr[1],
		:xpathP=>arr[2],
		:cssD=>arr[3],
		:xpathD=>arr[4],
		:kP=>arr[5]}

	data.each do |k,v|
		data[k]=nil if data[k]==""
	  #	puts data.inspect
  	end

  	data[:kP]=data[:kP].gsub(",",".").to_f

#puts data.inspect
gets
surgery data

#addtocsv data[:url], @price, @pdate
puts data[:url], @price, @pdate
	
end


#@output.close
input.close

gets