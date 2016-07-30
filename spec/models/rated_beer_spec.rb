require 'rails_helper'

RSpec.describe RatedBeer, type: :model do
  context "relationships" do
    it { should have_many(:user_rated_beers) }
    it { should have_many(:users) }
    it { should belong_to(:rated_brewery) }
  end

  context ".rate" do
    it "successfully rates a beer if not already rated" do
      user = create(:user, name: "Lucy Fox")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      beer = RatedBeer.rate("XXgGZ4", 1, user)
    end
  end
end
