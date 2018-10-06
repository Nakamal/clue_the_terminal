module CharactersController
  def characters_index_action
    response = HTTP.get("http://localhost:3000/api/characters")
    characters_index_view(response.parse)
    response.parse
  end

  def characters_show_action
    print "What is the id of the character you want to pick: "
    character_id = gets.chomp
    response = HTTP.get("http://localhost:3000/api/characters/#{character_id}")
    characters_show_view(response.parse)
  end
end