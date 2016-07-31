class CreateUserRatedBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_rated_beers do |t|
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :rated_beer, foreign_key: true

      t.timestamps
    end
  end
end
