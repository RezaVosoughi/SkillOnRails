class AddUserIdToFavorites < ActiveRecord::Migration[5.1]
  def change
	add_column :favorites, :user_id, :string
  end
end
