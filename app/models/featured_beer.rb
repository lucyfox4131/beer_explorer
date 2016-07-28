class FeaturedBeer
  def self.featured
    featured = BeerService.new.featured
    {brewery: get_brewery(featured), beer: get_beer(featured)}
  end

  def self.get_brewery(featured)
    Brewery.new(featured['data']['brewery'])
  end

  def self.get_beer(featured)
    Beer.new(featured['data']['beer'])
  end
end
