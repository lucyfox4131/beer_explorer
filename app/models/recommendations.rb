class Recommendations

  def initialize(current_user)
    @_user = current_user
  end

  def generate
    beer = user.rated_beers.to_a.sample
    if beer.style_id
      num = rand(2)
    else
      num = 0
    end

    recommendations(beer, num)
  end

  def service
    BeerService.new
  end

  def recommendations(beer, num)
    num == 1 ? rec_by_style(beer) : rec_by_brewery(beer)
  end

  def rec_by_style(beer)
    service.find_beers_for_style(beer.style_id)['data'].sample
  end

  def rec_by_brewery(beer)
    service.beers_for_brewery(beer.rated_brewery.api_id)["data"].sample
  end

  private

  def user
    @_user
  end
end
