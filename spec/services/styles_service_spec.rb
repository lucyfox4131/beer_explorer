require 'rails_helper'

describe "Styles Service" do
  context "#all_styles" do
    it 'returns a list of all styles' do
      VCR.use_cassette("styles") do
        styles = StyleService.new.all_styles['data']
        style = styles.first
        
        expect(styles.count).to eq(170)
        expect(style["id"]).to eq(1)
        expect(style["name"]).to eq("Classic English-Style Pale Ale")
      end
    end
  end
end
