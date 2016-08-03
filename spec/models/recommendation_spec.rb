require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  context "relationships" do
    it { should have_many(:user_recommendations) }
    it { should have_many(:users) }
  end
end
