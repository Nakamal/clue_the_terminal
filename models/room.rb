class Room
  attr_accessor :id, :name
  def initialize(options_hash)
    @id = options_hash["id"] 
    @name = options_hash["name"]
  end

  def self.find(input_id)
    response = HTTP.get("http://localhost:3000/api/rooms/#{input_id}")
    Room.new(response.parse)
  end

  def self.all
    response = HTTP.get("http://localhost:3000/api/rooms")
    response.parse.map { |room_hash| Room.new(room_hash) }
  end
end
