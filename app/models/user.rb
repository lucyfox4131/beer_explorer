class User < ApplicationRecord

  has_many :user_rated_beers
  has_many :rated_beers, through: :user_rated_beers
  has_many :user_recommendations
  has_many :recommendations, through: :user_recommendations

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
