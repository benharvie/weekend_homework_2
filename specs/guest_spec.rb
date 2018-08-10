require 'minitest/autorun'
require 'minitest/rg'
require_relative '../guest.rb'
require_relative '../room.rb'

class TestGuest < MiniTest::Test
  def setup
    @guest1 = Guest.new("Ben", 50.00, "Post Malone - Congratulations")
    @guest2 = Guest.new("Alvaro", 100.00, "SHOTGUN, GEORGE EZRA")
    @guest3 = Guest.new("Laura", 150.00, "RISE, JONAS BLUE FT JACK & JACK")
    @guest4 = Guest.new("James", 200.00, "YOUNGBLOOD, 5 SECONDS OF SUMMER")
    @guest5 = Guest.new("Callum", 10.00, "JACKIE CHAN, TIESTO/DZEKO/PREME/POST MALONE")

    @room1 = Room.new(10, 25.00)
    @room2 = Room.new(5, 10.00)
    @room3 = Room.new(25, 15.00)
  end

  def test_guest_has_name
    assert_equal("Ben", @guest1.name)
  end

  def test_guest_has_wallet_funds
    assert_equal(100.00, @guest2.wallet)
  end

  def test_guest_has_fav_song
    assert_equal("RISE, JONAS BLUE FT JACK & JACK", @guest3.fav_song)
  end

  def test_guest_adds_song
    @guest1.add_song("I like it", @room2)
    @guest1.add_song("God Is A Woman", @room2)
    p @room2.songs
    assert_equal(["I like it", "God Is A Woman"], @room2.songs)
  end

  def test_guest_added_favourite_song
    @guest1.add_song("Post Malone - Congratulations", @room2)
    assert_equal("OMG MY FAVE!", @guest1.is_favourite?("Post Malone - Congratulations", @room2))
  end
end
