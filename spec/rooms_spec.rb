require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative("../rooms")
require_relative("../songs")
require_relative("../guests")

class RoomsTest < MiniTest::Test

    def setup

        @song1 = Songs.new("Good Golly Miss Molly", "Little Richard")
        @song2 = Songs.new("100 days, 100 Nights", "Sharon Jones")
        @song3 = Songs.new("While My Guitar Gently Weeps", "The Beatles")
        @song4 = Songs.new("Walking After Midnight", "Patsy Cline") 
        @song5 = Songs.new("Sitting On The Dock Of The Bay", "Ottis Redding")
        @song6 = Songs.new("Lust For Life", "Iggy Pop")

        @songs1 = [@song1, @song2, @song3, @song4]
        @songs2 = [@song5, @song6]

        @rooms = Rooms.new("Codeclan Caraoke", 3, @songs1, 0.5)

        @guest1 = Guests.new("Bill", 40.0, @song2)
        @guest2 = Guests.new("Doris", 120.0, @song1)
        @guest3 = Guests.new("Richard", 10.0, @song3)  
        @guest4 = Guests.new("Victor", 300.0, @song4)

        @guests = [@guest1, @guest2, @guest3]
    end

    def test_room_has_name
        assert_equal("Codeclan Caraoke", @rooms.name)
    end

    def test_rooms_has_songs
        assert_equal(4, @rooms.number_of_songs)
    end

    def test_can_check_in_guests
        @rooms.check_in_guests(@guests)
        assert_equal(3, @rooms.guests.count)
    end

    def test_cannot_be_overbooked
        @rooms.check_in_guests(@guests)
        assert_equal(0, @rooms.check_in_guests([@guest4]))
    end

    def test_guests_can_check_out
        @rooms.check_in_guests(@guests)
        @rooms.check_out_guests
        assert_equal(0, @rooms.guests.count)
    end

    def test_can_cheer
        @rooms.check_in_guests(@guests)
        songs = @rooms.songs
        assert_equal("Whooo!", @guests[0].cheer(songs))
    end

    def test_money_got_deducted_for_entry
        @rooms.check_in_guests(@guests)
        assert_equal(1.5, @rooms.income)
    end

    def test_can_add_one_song
        @rooms.add_song(@song5)
        assert_equal(5, @rooms.number_of_songs)
    end

    def test_can_add_multiple_songs
        @rooms.add_multiple_songs(@songs2)
        assert_equal(6, @rooms.number_of_songs)
    end



end
