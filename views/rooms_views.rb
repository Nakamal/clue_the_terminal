module RoomsViews
  def rooms_show_view(room)
    puts
    puts room["name"]
    puts
  end

  def rooms_index_view(rooms_array)
    puts
    puts "Rooms"
    puts "-" * 30
    rooms_array.each do |rooms_hash|
      puts "#{rooms_hash["id"]} - #{rooms_hash["name"]}"
    end
    puts 
  end
end