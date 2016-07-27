class BeerSearch
  def self.find_random
    beer = new.random_beer
    Beer.new(beer)
  end

  def random_beer
    BeerService.new.random
  end
end
