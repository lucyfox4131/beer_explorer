class RatedBrewery < ApplicationRecord
  has_many :rated_beers

  def self.create_new(brewery)
  end
end
