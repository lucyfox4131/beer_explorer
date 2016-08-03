class Recs
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
      beer = StyleService.new.find_beers_for_style(beer.style_id)['data'].sample
      create_beers(beer)
    end
  end

  def rec_by_brewery(beer)
    beer = BreweryService.new.beers_for_brewery(beer.rated_brewery.api_id)["data"].sample
    create_beers(beer)
  end

  def create_beers(beer)
    Beer.new(beer)
  end

  private
  def user
    @_user
  end
end
