class AddPersonToFavorite < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :personId, :string
  end
end
