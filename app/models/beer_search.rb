class BeerSearch

  def self.service
    BeerService.new
  end

  def self.find_beer(params)
    service.beer_by_name(params["name"])
  end
end
