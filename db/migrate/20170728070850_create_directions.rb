class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.integer :step
      t.text :cooking_recipe
      t.string :blogs_cooking_pic
      t.belongs_to :recipe_blog, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
