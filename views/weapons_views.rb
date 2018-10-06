module WeaponsViews
  def weapons_show_view(weapon)
    puts
    puts weapon["name"]
    puts
  end

  def weapons_index_view(weapons_array)
    puts
    puts "Weapons"
    puts "-" * 30
    weapons_array.each do |weapons_hash|
      puts "#{weapons_hash["id"]} - #{weapons_hash["name"]}"
    end
    puts 
  end
end