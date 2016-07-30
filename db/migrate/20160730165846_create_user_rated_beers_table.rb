class CreateUserRatedBeersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_rated_beers do |t|
      t.integer :rating
      t.references :user, index: true, foreign_key: true
      t.references :rated_beer, index: true, foreign_key: true
    end
  end
end
