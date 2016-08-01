class BrewerySearch

  def self.service
    BeerService.new
  end

  def self.find_by(params)
    service.brewery_by_name(params['name'])
  end
end
