module RoomsController
  def rooms_index_action
    response = HTTP.get("http://localhost:3000/api/rooms")
    rooms_index_view(response.parse)
    response.parse
  end

  def rooms_show_action
    print "Where do you think the murder happened?: "
    room_id = gets.chomp
    room = Room.find(room_id)
    rooms_show_view(room)
  end
end