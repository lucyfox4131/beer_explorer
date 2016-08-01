class Beer
  attr_reader :beer_id, :name, :description, :abv, :ibu, :style_name, :style_description

  def initialize(beer)
    @beer_id            = beer["id"]
    @name               = beer["name"]
    @description        = beer["description"]
    @abv                = beer["abv"]
    @ibu                = beer["ibu"]
    @style_name         = style_name(beer)
    @style_description  = style_description(beer)
  end

  def self.create_beers(beers)
    beers.map do |beer|
      new(beer)
    end
  end

  def self.find_beer(id)
    beer = BeerService.new.find_beer(id)
    new(beer["data"])
  end

  def style_name(beer)
    beer["style"]["name"] if beer['style']
  end

  def style_description(beer)
    beer["style"]["description"] if beer['style']
  end
end
