class BrewerySearch

  def self.service
    BreweryService.new
  end

  def self.find_by(params)
    Rails.cache.fetch("brewery_#{params["name"]}/find_by", expires_in: 3.days) do
      service.brewery_by_name(params['name'])
    end
  end
end
