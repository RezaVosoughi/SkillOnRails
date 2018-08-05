class AddGenderToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :gender, :string
  end
end
