class Room
  attr_reader :capacity, :fee
  attr_accessor :people, :songs
  def initialize(capacity, fee)
    @capacity = capacity
    @fee = fee
    @people = []
    @songs = []
  end

  def has_capacity?
    @people.count < capacity ? true : false
  end
end
