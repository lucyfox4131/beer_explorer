require 'rails_helper'

RSpec.describe UserRecommendation, type: :model do
  context "relationships" do
    it { should belong_to :user }
    it { should belong_to :recommendation }
  end
end
