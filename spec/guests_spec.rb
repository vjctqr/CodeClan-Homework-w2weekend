require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guests")
require_relative("../songs")

class GuestsTest < MiniTest::Test

    def setup
        @song1 = Songs.new("The Way I Love You", "Aretha Franklin")
        @guests = Guests.new("Kate", 15.0, @song1)     
    end

    def test_guest_has_name
        assert_equal("Kate", @guests.name)
    end

    def test_guest_has_funds
        assert_equal(15.0, @guests.funds)
    end

    def test_guest_has_favourite_song
        assert_equal("The Way I Love You", @guests.favourite_song.title)
    end


end