class Beer
  attr_reader :beer_id, :name, :description, :abv, :ibu, :style_name, :style_description

  def initialize(beer)
    @beer_id            = beer["id"]
    @name               = beer["name"]
    @description        = beer["description"]
    @abv                = beer["abv"]
    @ibu                = beer["ibu"]
    @style_name         = beer["style"]["name"]
    @style_description  = beer["style"]["description"]
  end

  def self.create_beers(beers)
    beers.map do |beer|
      new(beer)
    end
  end
end
