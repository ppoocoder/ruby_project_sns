class CreateRecipeBlogsTags < ActiveRecord::Migration
  def change
    create_table :recipe_blogs_tags, :id =>false do |t|
      t.references :recipe_blog, index: true, foreign_key: true
      t.references :tag ,index: true, foreign_key: true
    end
  end
end
