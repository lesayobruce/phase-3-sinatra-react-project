class CreateMemes < ActiveRecord::Migration[6.1]
  def change
    create_table :memes do |t|
      t.integer :user_id
      t.string :name
      t.string :image_url
      
      t.timestamps null: false
    end
  end
end
