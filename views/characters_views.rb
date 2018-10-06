module CharactersViews
  def characters_show_view(character)
    puts
    puts character["name"]
    puts "Piece Color: #{character["color"]}"
    puts
  end

  def characters_index_view(character_array)
    puts
    puts "Characters"
    puts "-" * 30
    character_array.each do |character_hash|
       puts "#{character_hash["id"]} - #{Paint[character_hash["name"], character_hash["color"].downcase]}"
    end
    puts
  end
end
