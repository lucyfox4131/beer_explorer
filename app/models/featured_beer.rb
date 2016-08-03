class FeaturedBeer
  def self.featured
    featured = BeerService.new.featured
    {brewery: get_brewery(featured), beer: get_beer(featured)}
  end

  def self.get_brewery(featured)
    Rails.cache.fetch("featured/get_brewery", expires_in: 7.days) do
      Brewery.new(featured['data']['brewery'])
    end
  end

  def self.get_beer(featured)
    Rails.cache.fetch("featured/get_beer", expires_in: 7.days) do
      Beer.new(featured['data']['beer'])
    end
  end
end
