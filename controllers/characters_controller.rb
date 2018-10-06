module CharactersController
  def characters_index_action
    characters = Character.all
    characters_index_view(characters)
    characters
  end

  def characters_show_action
    print "What is the id of the character you want to pick: "
    character_id = gets.chomp
    character = Character.find(character_id)
    characters_show_view(character)
  end
end