class TriviaKnow < ActiveRecord::Base
     belongs_to :recipe_blog   #recipe blog에 속함
     belongs_to :blog_post
end
