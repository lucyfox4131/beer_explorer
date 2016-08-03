class BeerSearch

  def self.service
    BeerService.new
  end

  def self.find_beer(params)
    Rails.cache.fetch("beer_#{params["name"]}/find_beer", expires_in: 3.days) do
      service.beer_by_name(params["name"])
    end
  end
end
