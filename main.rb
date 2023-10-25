require 'sqlite3'
require 'sinatra'

db = SQLite3::Database.new "contacts"

contacts = db.execute <<-SQL 
  select * from contacts;
SQL

names = contacts.map { |contact| contact[1] }

get '/' do
    friends = names.map { | name | "<p>#{name}</p>" }.join(' ')
    "<h1>Friends</h1>#{friends}"
end
  
