require 'minitest/autorun'
require 'minitest/model'

require './tweet'

class TopicTest < Minitest::Test
    include Minitest::Model

    def setup
        @topic = Topic.new
    end

    def refulte_valid
        refute_valid @topic
    end

    def test_valid
        @topic.name = "healtcare"
        assert_valid    @topic
    end

    def test_requires_name
        refute_valid    @topic, :name
        @topic.name = "healtcare"

        assert_valid    @topic, :name
    end
end

