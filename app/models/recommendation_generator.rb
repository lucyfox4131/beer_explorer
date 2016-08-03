class RecommendationGenerator

  def self.generate(rating, beer, current_user)
    if rating != 0
      create_recs(recommendations(beer), current_user)
    end
  end

  def self.create_recs(beers, current_user)
    beers.each do |beer|
      recommendation = new_recommendation(beer)
      new_user_rec(recommendation, current_user)
    end
  end

  def self.new_user_rec(recommendation, user)
    UserRecommendation.create(recommendation: recommendation, user: user)
  end

  def self.new_recommendation(beer)
    Recommendation.create(name: beer["name"], api_id: beer["id"])
  end

  def self.recommendations(beer)
    recs_all = []
    recs_all << rec_by_style(beer)
    recs_all << rec_by_brewery(beer)
    recs_all.flatten
  end

  def self.rec_by_style(beer)
    if beer.style_id
      beer = StyleService.new.find_beers_for_style(beer.style_id)['data'].sample(3)
    end
  end

  def self.rec_by_brewery(beer)
    beer = BreweryService.new.beers_for_brewery(beer.rated_brewery.api_id)["data"].sample(3)
  end
end
