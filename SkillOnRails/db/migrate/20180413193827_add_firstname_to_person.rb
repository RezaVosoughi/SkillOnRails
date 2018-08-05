class AddFirstnameToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :firstname, :string
  end
end
