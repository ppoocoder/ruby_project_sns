class AddImageToRecipeBlogs < ActiveRecord::Migration
  def change
     add_column :recipe_blogs, :blogs_main_pic ,:string
    #  add_column :recipe_blogs, :blog_cooking_pic, :string
     add_column :recipe_blogs, :blogs_dish_pic, :string
  end
end
