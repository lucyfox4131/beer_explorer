class CreateUserRatedBeersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_rated_beers_tables do |t|
      t.integer :rating
      t.references :users, foreign_key: true
      t.references :rated_beers, foreign_key: true
    end
  end
end
