class AddTitleToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :title, :string
  end
end
