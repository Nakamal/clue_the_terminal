module WeaponsController
  def weapons_index_action
    response = HTTP.get("http://localhost:3000/api/weapons")
    weapons_index_view(response.parse)
    response.parse
  end

  def weapons_show_action
    print "How do think they did it?: "
    weapon_id = gets.chomp
    weapon = Weapon.find(weapon_id)
    weapons_show_view(weapon)
  end
end