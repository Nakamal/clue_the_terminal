require 'http'
require 'paint'

require_relative "models/character"
require_relative "models/weapon"
require_relative "models/room"
require_relative "models/player"

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
    system "clear"

    puts
    puts "You have found...Clue the App!"
    puts
    puts "Would you like to Start a new game?"
    puts "OR"
    puts "Join an existing mystery?"
    puts 
    print 'type "new" or "join": '
    new_game_choice = gets.chomp

    if new_game_choice == "new"
      @current_game_id = HTTP.post("http://localhost:3000/api/games").parse["id"]
      puts "You are now playing game number: #{@current_game_id}"
    else
      puts
      print "Please enter game id: "
      @current_game_id = gets.chomp.to_i
      puts "Current Game Being Played: #{@current_game_id}"

    end

    pick_player
  end

  def pick_player
    print "Are you Player 1, Player 2 or Player 3: "
    @player_id = gets.chomp.to_i

    while true
      puts 
      parsed_response = HTTP.get("http://localhost:3000/api/games/#{@current_game_id}").parse
      parsed_response["available_characters"].each do |character_hash|
        puts "#{character_hash["id"]} - #{character_hash["name"]}"
      end

      puts
      print "pick a character id: "  
      character_id = gets.chomp.to_i

      parsed_response = HTTP.post("http://localhost:3000/api/games/#{@current_game_id}/participations?character_id=#{character_id}&player_id=#{@player_id}").parse

      if parsed_response["move_forward"]
        puts "we know this will error"
        # what info do you have for json in a show/create for participations
        @player = Player.new()
        return true
      end
    end
  end

  def run
    
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
 
