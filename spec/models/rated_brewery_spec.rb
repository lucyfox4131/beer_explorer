require 'rails_helper'

RSpec.describe RatedBrewery, type: :model do
  context "relationships" do
    it { should have_many(:rated_beers) }
  end
end
