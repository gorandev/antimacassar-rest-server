require 'active_record'



class Topic < ActiveRecord::Base

  # Database path
  # take the path from the microservice
  # this must be set in .env the assignation is for save time
  PATH_DATABASE = '/usr/src/microservice/db/development.sqlite3'

  establish_connection adapter: "sqlite3", database: PATH_DATABASE
  has_many  :tweets, dependent: :destroy
end

class Tweet < ActiveRecord::Base
  # Database path
  # take the path from the microservice
  # this must be set in .env the assignation is for save time
  PATH_DATABASE = '/usr/src/microservice/db/development.sqlite3'


  establish_connection adapter: "sqlite3", database: PATH_DATABASE
  belongs_to :topic
end
