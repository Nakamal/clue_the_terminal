require 'http'
require 'paint'

require_relative "models/character"
require_relative "models/weapon"
require_relative "models/room"

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
    @current_game_id = HTTP.post("http://localhost:3000/api/games").parse["id"]

    puts 
    print "player 1 & 2: "
    @player_id = gets.chomp.to_i
    puts 

    pick_player

  end

  def pick_player
    while true
      puts 
      characters_index_action
      puts
      print "pick a character id: "  
      character_id = gets.chomp.to_i

      parsed_respone = HTTP.post("http://localhost:3000/api/games/#{@current_game_id}/participations?character_id=#{character_id}&player_id=#{@player_id}").parse

      if parsed_respone["move_forward"]
        @player = Player.new()
        return 
      else

      end
    end
  end

  # def participation
  #   puts 
  #   puts "Will you be player 1 or 2 today? "
  #   selection = gets.chomp
  #   puts
  #   if selection == "1"
  #     puts "which character would you like to choose? "
  #     @players << @characters 
  #     p @players
  #   elsif selection == "2"
  #     puts
  #     puts "And who will you be?"
  #     @players << @characters
  #     p @players
  #   end 
  # end

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
      puts "   [7] Play the game and solve...(thunder and lightning crash)...a murder?"
      puts
      puts "   [8] Make a suggestion"
      puts
      puts "   [0] Make your accusation"
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
        participation
      elsif choice == "0"
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
 
