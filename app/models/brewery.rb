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
    Rails.cache.fetch("brewery_beers_#{self.brewery_id}/beers", expires_in: 3.days) do
      beers = BeerService.new.beers_for_brewery(self.brewery_id)
      Beer.create_beers(beers["data"])
    end
  end

  def self.find(id)
    Rails.cache.fetch("brewery_by_id_#{id}/find", expires_in: 3.days) do
      brewery = service.find_brewery(id)
      new(brewery['data'])
    end
  end
end
