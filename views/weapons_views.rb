module WeaponsViews
  def weapons_show_view(weapon)
    puts
    puts weapon.name
    puts
  end

  def weapons_index_view(weapons_array)
    puts
    puts "Weapons"
    puts "-" * 30
    weapons_array.each do |weapon|
      puts "#{weapon.id} - #{weapon.name}"
    end
    puts 
  end
end