module CharactersViews
  def characters_show_view(character)
    puts
    puts character.formatted_name
    puts "Piece Color: #{character.formatted_color}"
    puts
  end

  def characters_index_view(characters)
    puts
    puts "Characters"
    puts "-" * 30
    characters.each do |character|
       puts "#{character.id} - #{character.formatted_name}"
    end
    puts
  end
end
