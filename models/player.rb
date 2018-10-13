class Player  
  attr_accessor :id, :username

  def initialize(player_options_hash, character_options_hash)
    @id = player_options_hash["id"]
    @username = player_options_hash["username"]
    @character = Character.new(character_options_hash)
  end
end