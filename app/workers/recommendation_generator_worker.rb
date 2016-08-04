class RecommendationGeneratorWorker
  include Sidekiq::Worker

  def perform(rating, beer_id, user_id)
    RecommendationGenerator.generate(rating, beer_id, user_id)
  end
end
