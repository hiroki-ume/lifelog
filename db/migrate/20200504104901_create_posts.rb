class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :genre_id
      t.integer :user_id
      t.string :source
      t.string :word
      t.string :action

      t.timestamps
    end
  end
end
