class RatedBrewery < ApplicationRecord
  has_many :rated_beers

  def self.create_new(brewery)
    RatedBrewery.create(api_id: brewery["id"],
                        name: brewery["name"],
                        image: brewery["images"]["icon"],
                        postal_code: brewery["locations"].first["postalCode"])
  end
end
