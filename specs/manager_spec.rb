require 'minitest/autorun'
require 'minitest/rg'
require_relative '../song.rb'
require_relative '../guest.rb'
require_relative '../room.rb'
require_relative '../manager.rb'

class TestManager < MiniTest::Test
  def setup
    @manager = Manager.new()

    @song1 = Song.new("IN MY FEELINGS, DRAKE")
    @song2 = Song.new("SHOTGUN, GEORGE EZRA")
    @song3 = Song.new("RISE, JONAS BLUE FT JACK & JACK")

    @guest1 = Guest.new("Ben", 50.00, "JACKIE CHAN, TIESTO/DZEKO/PREME/POST MALONE")
    @guest2 = Guest.new("Alvaro", 100.00, "SHOTGUN, GEORGE EZRA")
    @guest3 = Guest.new("Laura", 150.00, "RISE, JONAS BLUE FT JACK & JACK")
    @guest4 = Guest.new("Bam", 1.00, "RISE, JONAS BLUE FT JACK & JACK")

    @room1 = Room.new(10, 25.00)
    @room2 = Room.new(5, 10.00)
    @room3 = Room.new(25, 15.00)
  end

  def test_guest_has_enough_money_for_room
    assert_equal(true, @manager.guest_has_enough_money?(@guest1, @room1))
  end

  def test_guest_does_not_have_enough_money_for_room
    assert_equal(false, @manager.guest_has_enough_money?(@guest4, @room1))
  end

  def test_check_in_guest__enough_money
    @manager.check_in(@guest1, @room1)
    assert_equal(1, @room1.people.count)
  end

  def test_check_in_guest__not_enough_money
    @manager.check_in(@guest4, @room1)
    assert_equal(0, @room1.people.count)
  end

  def test_check_out_guest
    @manager.check_in(@guest1, @room1)
    @manager.check_in(@guest3, @room1)
    @manager.check_in(@guest2, @room1)

    @manager.check_out(@guest3, @room1)
    assert_equal(2, @room1.people.count)
  end

  def test_till_takes_money
    @manager.check_in(@guest2, @room3)
    assert_equal(15.00, @manager.till)
  end

  def test_check_in_multiple_guests_in_one_room
    @manager.check_in(@guest1, @room1) #1
    @manager.check_in(@guest2, @room1) #2
    @manager.check_in(@guest3, @room1) #3
    @manager.check_in(@guest4, @room1) #Not enough money, total checked_in = 3
    assert_equal(3, @room1.people.count)
  end

  def test_room_hits_capacity
    @manager.check_in(@guest1, @room1)
    @manager.check_in(@guest2, @room1)
    @manager.check_in(@guest3, @room1)
    @manager.check_in(@guest1, @room1)
    @manager.check_in(@guest2, @room1)
    @manager.check_in(@guest3, @room1)
    @manager.check_in(@guest1, @room1)
    @manager.check_in(@guest2, @room1)
    @manager.check_in(@guest3, @room1)
    @manager.check_in(@guest1, @room1)
    @manager.check_in(@guest2, @room1)
    @manager.check_in(@guest1, @room1)
    @manager.check_in(@guest2, @room1)
    @manager.check_in(@guest3, @room1)
    @manager.check_in(@guest1, @room1)
    @manager.check_in(@guest2, @room1)
    @manager.check_in(@guest3, @room1)
    @manager.check_in(@guest1, @room1)
    @manager.check_in(@guest2, @room1)
    @manager.check_in(@guest3, @room1)
    assert_equal(10, @room1.people.count)
  end
end
