module WeaponsViews
  def weapons_show_view(weapon)
    puts
    puts weapon.name
    puts
  end

  def weapons_index_view(weapons)
    puts
    puts "Weapons"
    puts "-" * 30
    weapons.each do |weapon|
      puts "#{weapon.id} - #{weapon.name}"
    end
    puts 
  end
end