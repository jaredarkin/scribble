class AddPhotoUrlAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photo_url, :string
    add_column :users, :location, :string
  end
end
