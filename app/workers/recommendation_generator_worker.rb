class RecommendationGeneratorWorker
  include Sidekiq::Worker

  def perform(rating, beer, user)
    RecommendationGenerator.generate(rating, beer, user)
  end
end
