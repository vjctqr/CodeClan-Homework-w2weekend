require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../songs")

class SongsTest < MiniTest::Test
    
    def setup
        @songs = Songs.new("The Way I Love You", "Aritha Franklin")
    end

    def test_song_has_title
        assert_equal("The Way I Love You", @songs.title)
    end

    def test_song_has_artist
        assert_equal("Aritha Franklin", @songs.artist)
    end
end