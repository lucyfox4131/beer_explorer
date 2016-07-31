require 'rails_helper'

RSpec.describe User, type: :model do
  context "relationships" do
    it { should have_many(:user_rated_beers) }
    it { should have_many(:rated_beers) }
  end
end
