class Room
  attr_accessor :name
  def initialize(options_hash)
    @name = options_hash["name"]
  end

  def self.find(input_id)
    response = HTTP.get("http://localhost:3000/api/rooms/#{input_id}")
    Room.new(response.parse)
  end
end