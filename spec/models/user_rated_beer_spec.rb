require 'rails_helper'

RSpec.describe UserRatedBeer, type: :model do
  context "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:rated_beer) }
  end
end
