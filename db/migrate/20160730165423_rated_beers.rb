class RatedBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :rated_beers do |t|
      t.string :api_id
      t.string :name
      t.string :style_id
      t.references :rated_breweries, index: true, foreign_key: true

      t.timestamps
    end
  end
end
