class Generate-memes < ActiveRecord::Migration[6.1]
  def change
    create_table :memes do |t|
      t.string :name
      t.string :url
      t.integer :user_id
    end
  end
end
