class CreateUserRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_recommendations do |t|
      t.references :user
      t.references :recommendation

      t.timestamps
    end
  end
end
