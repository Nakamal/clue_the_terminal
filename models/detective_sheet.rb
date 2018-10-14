class DetectiveSheet
  attr_accessor :characters, :weapons, :rooms
  def initialize(sections_hash)
    @characters = sections_hash["characters"]
    @weapons = sections_hash["weapons"]
    @rooms = sections_hash["rooms"]
  end

  def display
    width = 30
    puts "╔" + "═" * width + "╗"
    puts "║" + "Suspects".center(width) + "║"
    puts "╠" + "═" * width + "╣"
    @characters.each do |character|
      puts "║" + character["card"]["subject"]["name"].center(width - 11) + "|" + character["printed_status"].center(10) + "║"
      puts "║" + "-" * width + "║"
    end
    puts "╔" + "═" * width + "╗"
    puts "║" + "Weapons".center(width) + "║"
    puts "╠" + "═" * width + "╣"
    @weapons.each do |weapon|
      puts "║" + weapon["card"]["subject"]["name"].center(width - 11) + "|" + weapon["printed_status"].center(10) + "║"
      puts "║" + "-" * width + "║"
    end
    puts "╔" + "═" * width + "╗"
    puts "║" + "Rooms".center(width) + "║"
    puts "╠" + "═" * width + "╣"
    @rooms.each do |room|
      puts "║" + room["card"]["subject"]["name"].center(width - 11) + "|" + room["printed_status"].center(10) + "║"
      puts "║" + "-" * width + "║"
    end
    puts "╚" + "═" * width + "╝"
  end
end