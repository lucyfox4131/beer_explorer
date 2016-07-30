class RatedBeer < ApplicationRecord
  has_many :user_rated_beers
  has_many :users, through: :user_rated_beers
  belongs_to :rated_brewery

  def self.service
    @service = BeerService.new
  end

  def self.rate(beer_id, rating, current_user)

    # where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
    #   user.provider = auth.provider
    #   user.uid = auth.uid
    #   user.name = auth.info.name
    #   user.oauth_token = auth.credentials.token
    #   user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    #   user.save!
  end
end
