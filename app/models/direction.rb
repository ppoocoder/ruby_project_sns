class Direction < ActiveRecord::Base
  belongs_to :recipe_blog                                                 #recipe 블로그에 속하며 blog_cooking_pic  이미지 업로드를 허용한다. 
  # accepts_nested_attributes_for :blog_cooking_pic
  
  mount_uploader :blogs_cooking_pic, BlogImageUploader

end
