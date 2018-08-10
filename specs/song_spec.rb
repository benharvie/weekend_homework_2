require 'minitest/autorun'
require 'minitest/rg'
require_relative '../song.rb'

class TestSong < MiniTest::Test
  def setup
    @song1 = Song.new("IN MY FEELINGS, DRAKE")
    @song2 = Song.new("SHOTGUN, GEORGE EZRA")
    @song3 = Song.new("RISE, JONAS BLUE FT JACK & JACK")
    @song4 = Song.new("YOUNGBLOOD, 5 SECONDS OF SUMMER")
    @song5 = Song.new("JACKIE CHAN, TIESTO/DZEKO/PREME/POST MALONE")
  end

  def test_song_has_name
    assert_equal("IN MY FEELINGS, DRAKE", @song1.name)
  end
end
