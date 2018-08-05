class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
	  t.integer :favorites
      t.timestamps
    end
  end
end
