input = File.open "input.csv", "r"




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
end

		puts data.inspect
end




input.close
gets