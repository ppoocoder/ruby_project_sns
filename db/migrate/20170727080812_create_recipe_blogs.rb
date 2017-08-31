class CreateRecipeBlogs < ActiveRecord::Migration
  def change
    create_table :recipe_blogs do |t|
      t.string :title
      t.string :country ##국가 변수 추가 
      t.text :r_description
      
      
      
      t.integer :likes_count
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
