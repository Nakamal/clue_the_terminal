require 'http'
require 'paint'

require_relative "models/character"
require_relative "models/weapon"
require_relative "models/room"
require_relative "models/player"
require_relative "models/card"
require_relative "models/hand"
require_relative "models/detective_sheet"

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
    @rooms = Room.all

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
      @initialized_game = true
      @current_game_id = HTTP.post("http://localhost:3000/api/games").parse["id"]
      puts "You are now playing game number: #{@current_game_id}"
    else
      @initialized_game = false
      puts
      print "Please enter game id: "
      @current_game_id = gets.chomp.to_i
      puts "Current Game Being Played: #{@current_game_id}"
    end
    pick_player
    waiting
  end

def waiting
  while true
    system "clear"
    puts "waiting to start..."

    if @initialized_game 
      print "If all the players are in, then type 'start' and press enter: "
      onclick = gets.chomp

      if onclick == "start"
        parsed_response = HTTP.patch("http://localhost:3000/api/games/#{@current_game_id}/start?initialized_game=true").parse
      end
    else
      puts "Check if it's time to start the game, by pressing enter"
      gets.chomp

      parsed_response = HTTP.patch("http://localhost:3000/api/games/#{@current_game_id}/start").parse
    end

    if parsed_response["start_game"]
      puts "game started -- Move On in the code."
      parsed_response = HTTP.get("http://localhost:3000/api/participations/#{@participation_id}/sheet").parse
      @hand = Hand.new(parsed_response["cards"])
      @detective_sheet = DetectiveSheet.new(parsed_response["sheet_infos"])
      return true
    end
  end
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
        @player = Player.new(parsed_response["player"], parsed_response["character"])
        @participation_id = parsed_response["id"]
        return true
      end
    end
  end

  def play
    system "clear"
    @hand.display
    puts "*****************"
    @detective_sheet.display
  end

  def decisions
    # my_turn = call to determine if it is my_turn
    if my_turn
      legit_room = false
      until legit_room
        puts 
        rooms_index_view(@rooms)
        puts "What room would you like to go to?"
        choice = gets.chomp

        choosen_rooms = @rooms.select {|room| room.name == choice }
        legit_room = choosen_rooms.any?
      end

      @current_location = choosen_rooms.first.name
      # make an api call that updates your location

      @hand.display
      puts "*" * 30
      @detective_sheet.display

      puts "Would you like to make a suggestion?"
      puts
      puts "OR...Bum bum bum bum..."
      puts
      puts "Make an accusation!"

      choice = gets.chomp

      if choice == "suggestion"
        suggestion_action
      elsif choice == "accusation"
        accusation_action
      end 
      # make call that moves api to the next turn
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


MainGame.new.play
 
