class AddImageToUsersAndPins < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :pins, :pin_image, :string
  end
end
