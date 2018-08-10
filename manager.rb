class Manager
  attr_accessor(:till)
  def initialize
    @till = 0
  end

  def guest_has_enough_money?(guest, room)
    guest.wallet >= room.fee ? true : false
  end

  def check_in(guest, room)
    if guest_has_enough_money?(guest, room) && room.has_capacity?
      @till += room.fee
      room.people.push(guest)
    end
  end

  def check_out(guest, room)
    room.people.delete(guest)
  end
end
