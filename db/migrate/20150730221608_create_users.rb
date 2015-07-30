class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :photo_url
      t.string :location
      t.timestamps null: false
      t.integer :role
    end
  end
end
