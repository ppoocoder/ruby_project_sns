class CreateIngrediants < ActiveRecord::Migration
  def change
    create_table :ingrediants do |t|
      t.string :name
      t.belongs_to :recipe_blog, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
