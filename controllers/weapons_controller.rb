module WeaponsController
  def weapons_index_action
    weapons = Weapon.all
    weapons_index_view(weapons)
    weapons
  end

  def weapons_show_action
    print "How do think they did it?: "
    weapon_id = gets.chomp
    weapon = Weapon.find(weapon_id)
    weapons_show_view(weapon)
  end
end