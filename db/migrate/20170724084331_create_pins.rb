class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
     t.string :country
     t.string :country_code
     t.text :p_description
     t.integer:task 
     t.belongs_to :user
     t.integer :likes_count
     t.timestamps
    end
  end
end
