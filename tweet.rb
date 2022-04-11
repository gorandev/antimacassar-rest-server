require 'active_record'

class Tweet < ActiveRecord::Base
    establish_connection adapter: "sqlite3", database: "../ruby-tweet-microservice/db/development.sqlite3"

end

=begin
t = Tweet.find_by(autor_id: "1032288595313348609")
Tweet.all.map do  |x|  
    puts x.autor_id
    puts x.text
end
puts t.to_json
tweet = Tweet.new
tweet.autor_id  = "1032288595313348609"
tweet.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam molestie ex nec ligula consectetur rhoncus."
tweet.topic = "dev example"
tweet.attachments = ['media 1', 'media 2', 'media 3', 'media 4'].to_json
tweet.save
=end
