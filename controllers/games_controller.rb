module GamesController
  def accusation_action
    characters = characters_index_action
    print "Which character id?: "
    character_id = gets.chomp.to_i
    characters_hash = characters.map { |character| [character.id, character.name] }.to_h

    weapons = weapons_index_action
    print "Which weapon id? "
    weapon_id = gets.chomp.to_i
    weapons_hash = weapons.map { |weapon| [weapon.id, weapon.name] }.to_h

    rooms = rooms_index_action
    print "Which room id? " 
    room_id = gets.chomp.to_i
    rooms_hash = rooms.map { |room| [room.id, room.name] }.to_h
    
    puts
    accusation_view(character: characters_hash[character_id], room: rooms_hash[room_id], weapon: weapons_hash[weapon_id])
  end
end

# module GamesController
#   def accusation_action    
#     accusation_view(character: accusation_helper("character"), weapon: accusation_helper("weapon"), room: accusation_helper("room"))
#   end

#   def accusation_helper(type)
#     code_string = <<-PICK
#     action_result = #{type}s_index_action
#     print "Which #{type} id? " 
#     type_id = gets.chomp.to_i
#     types_in_hash = action_result.map {|type_hash| [type_hash["id"], type_hash["name"]] }.to_h
#     types_in_hash[type_id]
#     PICK

#     eval(code_string)
#   end
# end