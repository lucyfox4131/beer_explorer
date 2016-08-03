class RenameApiKeyAsApiId < ActiveRecord::Migration[5.0]
  def change
    rename_column :recommendations, :api_key, :api_id
  end
end
