

 require 'sqlite3'

db = SQLite3::Database.new( "test.db" )

db.execute "SELECT * FROM Prices" do |id|
	puts id
	puts "===="

end

db.close