require 'minitest/autorun'
require 'minitest/model'

require './tweet'

class TweetTest < Minitest::Test
    include Minitest::Model

    def setup
        @tweet = Tweet.new
    end

    def test_invalid
        refute_valid    @tweet
    end

    def test_valid
        @tweet.text = "this is a test Tweet"
        @tweet.author_id = "135599641"

        assert_valid @tweet, :author_id
    end

    def test_requires
        refute_valid @tweet, :author_id
        @tweet.author_id = "135599641"
        @tweet.text = "this is a test Tweet"
#        refute_valid    @tweet, :text

        assert_valid    @tweet, :text
    end

end
