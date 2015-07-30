class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :photo_url
      t.text :body
      t.timestamps null: false
      t.references :user, index: true, foreign_key: true
    end
  end
end
