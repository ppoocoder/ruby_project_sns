class Ingrediant < ActiveRecord::Base
  belongs_to :recipe_blog   #recipe blog에 속함
  has_and_belongs_to_many :tags 
end
