require 'http'
require 'paint'

require_relative "views/characters_views"
require_relative "views/weapons_views"
require_relative "views/rooms_views"

require_relative "views/games_views"

require_relative "controllers/characters_controller"
require_relative "controllers/weapons_controller"
require_relative "controllers/rooms_controller"

require_relative "controllers/games_controller"


class MainGame
  include CharactersViews
  include WeaponsViews
  include RoomsViews

  include GamesViews

  include CharactersController
  include WeaponsController
  include RoomsController

  include GamesController

  def initialize
    @players = []
  end

  def run
    system "clear"

    puts
    puts "Welcome to Clue the App!"
    puts

    while true
      puts "Would you like to..."
      puts "   [1] View available_characters"
      puts "   [2] Pick a character"
      puts "   [3] See possible murder spots"
      puts "   [4] Pick where you think the murder happened"
      puts "   [5] Look at what they could have used"
      puts "   [6] What you think they commited the murder with"
      puts
      puts "   [7] Make your accusation"
      puts
      puts "   [quit] Stop"

      choice = gets.chomp

      if choice == "1"
        characters_index_action
      elsif choice == "2"
        characters_show_action
      elsif choice == "3"
        rooms_index_action
      elsif choice == "4"
        rooms_show_action
      elsif choice == "5"
        weapons_index_action
      elsif choice == "6"
        weapons_show_action
      elsif choice == "7"
        accusation_action
      elsif choice == "quit"
        exit
      end
          
      puts "press enter to continue"
      gets
      system "clear"
    end
  end
end


MainGame.new.run
 