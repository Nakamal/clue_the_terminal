module RoomsViews
  def rooms_show_view(room)
    puts
    puts room.name
    puts
  end

  def rooms_index_view(rooms)
    puts
    puts "Rooms"
    puts "-" * 30
    rooms.each do |room|
      puts "#{room.id} - #{room.name}"
    end
    puts 
  end
end