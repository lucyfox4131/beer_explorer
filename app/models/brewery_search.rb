class BrewerySearch

  def self.service
    BreweryService.new
  end

  def self.find_by(params)
    if params["name"]
        service.brewery_by_name(params['name'])
    else
      service.brewery_by_zip(params["zip"])["data"]
    end
  end
end
