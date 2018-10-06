module RoomsController
  def rooms_index_action
    rooms = Room.all
    rooms_index_view(rooms)
    rooms
  end

  def rooms_show_action
    print "Where do you think the murder happened?: "
    room_id = gets.chomp
    room = Room.find(room_id)
    rooms_show_view(room)
  end
end