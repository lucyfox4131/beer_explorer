class Recommendations
  attr_reader :recs

  def initialize(current_user)
    @_user = current_user
    @recs = []
  end

  def generate
    user.user_rated_beers.each do |user_rating|
      if user_rating.rating == 1
        beer = user_rating.rated_beer
        recommendations(beer)
      end
    end
  end

  def recommendations(beer)
    @recs << rec_by_style(beer)
    @recs << rec_by_brewery(beer)
  end

  def rec_by_style(beer)
    if beer.style_id
      beers = StyleService.new.find_beers_for_style(beer.style_id)['data']
      create_beers(beers)
    end
  end

  def rec_by_brewery(beer)
    beers = BreweryService.new.beers_for_brewery(beer.rated_brewery.api_id)["data"]
    create_beers(beers)
  end

  def create_beers(beers)
    beers.map do |beer|
      Beer.new(beer)
    end
  end

  private
  def user
    @_user
  end
end
