class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :user_id
      t.string :image
      t.text :introduction
      t.string :address
      t.integer :price
      
      t.timestamps
    end
  end
end
