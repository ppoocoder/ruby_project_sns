class Tag < ActiveRecord::Base
    has_and_belongs_to_many :pins
    
    
    has_and_belongs_to_many :recipe_blogs
      has_and_belongs_to_many :ingrediants
    
end
