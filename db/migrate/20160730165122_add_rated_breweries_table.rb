class AddRatedBreweriesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :rated_breweries do |t|
      t.string :api_key
      t.string :name
      t.string :image
      t.string :postal_code

      t.timestamps
    end
  end
end
