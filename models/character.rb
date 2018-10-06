class Character
  attr_accessor :id, :name, :color
  def initialize(options_hash)
    @id = options_hash["id"]
    @name = options_hash["name"]
    @color = options_hash["color"]
  end

  def formatted_color
    Paint[color, color.downcase]
  end

  def formatted_name
    Paint[name, color.downcase]
  end

  def self.find(input_id)
    response = HTTP.get("http://localhost:3000/api/characters/#{input_id}")
    Character.new(response.parse)
  end
end