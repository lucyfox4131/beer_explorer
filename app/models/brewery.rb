class Brewery
  attr_reader :brewery_id, :name, :description, :website, :image, :address

  def initialize(brewery)
    @brewery_id       = brewery["id"]
    @name             = brewery["name"]
    @description      = brewery["description"]
    @website          = brewery["website"]
    @image            = brewery_image(brewery)
    @address          = brewery_location(brewery)
  end

  def self.service
    @service = @service ||= BeerService.new
  end

  def brewery_image(brewery)
    brewery["images"]["icon"] if brewery["images"]
  end

  def brewery_location(brewery)
    brewery["locations"].first["streetAddress"] if brewery["locations"]
  end

  def beers
    beers = BeerService.new.beers_for_brewery(self.brewery_id)
    Beer.create_beers(beers["data"])
  end

  def self.find(id)
    brewery = service.find_brewery(id)
    new(brewery['data'])
  end

  def self.create_breweries(breweries)
    breweries['data'].map do |brewery|
      new(brewery)
    end
  end
end
