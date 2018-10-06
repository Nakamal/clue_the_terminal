class Weapon
  attr_accessor :id, :name
  def initialize(options_hash)
    @id = options_hash["id"]
    @name = options_hash["name"]
  end

  def self.find(input_id)
    response = HTTP.get("http://localhost:3000/api/weapons/#{input_id}")
    Weapon.new(response.parse)
  end

  def self.all
    response = HTTP.get("http://localhost:3000/api/weapons")
    response.parse.map { |weapon_hash| Weapon.new(weapon_hash) }
  end
end