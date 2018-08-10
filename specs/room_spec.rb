require 'minitest/autorun'
require 'minitest/rg'
require_relative '../room.rb'
require_relative '../manager.rb'
require_relative '../guest.rb'

class TestRoom < MiniTest::Test
  def setup
    @manager = Manager.new()

    @room1 = Room.new(10, 25.00)
    @room2 = Room.new(5, 10.00)
    @room3 = Room.new(25, 15.00)
    @room4 = Room.new(40, 10.00)
    @room5 = Room.new(7, 20.00)

    @guest1 = Guest.new("Ben", 50.00, "JACKIE CHAN, TIESTO/DZEKO/PREME/POST MALONE")
    @guest2 = Guest.new("Alvaro", 100.00, "SHOTGUN, GEORGE EZRA")
    @guest3 = Guest.new("Laura", 150.00, "RISE, JONAS BLUE FT JACK & JACK")
    @guest4 = Guest.new("James", 200.00, "YOUNGBLOOD, 5 SECONDS OF SUMMER")
    @guest5 = Guest.new("Callum", 10.00, "JACKIE CHAN, TIESTO/DZEKO/PREME/POST MALONE")
  end

  def test_room_has_capacity
    assert_equal(10, @room1.capacity)
  end

  def test_room_has_fee
    assert_equal(10.00, @room2.fee)
  end

  def test_room_starts_empty
    assert_equal(0, @room4.people.count)
  end

  def test_room_has_enough_capacity__has_space
    assert_equal(true, @room1.has_capacity?)
  end

  def test_room_has_enough_capacity__has_no_space
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
    assert_equal(false, @room1.has_capacity?)
  end
end
