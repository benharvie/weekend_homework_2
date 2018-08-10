class Guest
  attr_reader :name, :fav_song
  attr_accessor :wallet
  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def add_song(title, room)
    room.songs.push(title)
  end

  def is_favourite?(song, room)
    if room.songs.include?(song)
      system("open #{"https://www.youtube.com/watch?v=SC4xMk98Pdc"}")
      return "OMG MY FAVE!"
    end
  end
end
