class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.string :name
      t.string :api_key

      t.timestamps
    end
  end
end
