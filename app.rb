require 'json'
require 'yaml'

require 'sinatra/activerecord'
require 'sinatra/base'

require 'active_record'
require 'sqlite3'

require 'sinatra-rest-api'
require './tweet.rb'

module ActiveRecordTest

    class App < Sinatra::Application
        register Sinatra::RestApi
        register Sinatra::ActiveRecordExtension

        # Models
        #
        # class Tweet and Topic Models
        # for serve content
        resource Tweet
        resource Topic

        before do
            content_type :json
            headers( 'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => 'HEAD,GET,POST,OPTIONS',
            'Access-Control-Allow-Headers' => 'Origin, Content-Type, Accept, Authorization, Token',
            'Access-Control-Expose-Headers' => 'X-Total-Count' )
        end

        options '*' do
            response.headers['Access-Control-Allow-Origin'] = '*'
            response.headers['Access-Control-Allow-Methods'] = 'HEAD,GET,POST,OPTIONS'
            response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
            halt 200
        end

        get '/' do
            Sinatra::RestApi::Router.list_routes.to_json
        end

        not_found do
            return if JSON.parse( body[0] ).include?( 'error' ) rescue nil
            [ 404, { message: '404 Error' }.to_json ]
        end

        run! if app_file == $PROGRAM_NAME
    end
end


