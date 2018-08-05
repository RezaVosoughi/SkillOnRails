class AddImageToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :image, :string
  end
end
