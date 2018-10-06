module GamesController
  def accusation_action
    character_response = characters_index_action
    print "Which character id?: "
    character_id = gets.chomp.to_i
    characters = character_response.map {|character_hash| [character_hash["id"], character_hash["name"]] }.to_h

    weapons_response = weapons_index_action
    print "Which weapon id? "
    weapon_id = gets.chomp.to_i
    weapons = weapons_response.map {|weapon_hash| [weapon_hash["id"], weapon_hash["name"]] }.to_h

    rooms_response = rooms_index_action
    print "Which room id? " 
    room_id = gets.chomp.to_i
    rooms = rooms_response.map {|room_hash| [room_hash["id"], room_hash["name"]] }.to_h
    
    puts
    accusation_view(character: characters[character_id], room: rooms[room_id], weapon: weapons[weapon_id])
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