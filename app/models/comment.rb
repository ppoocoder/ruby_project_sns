class Comment < ActiveRecord::Base
    belongs_to :user               # comment의 모델 변수들이 user와 pin의 모델에 속함
    belongs_to :pin
    belongs_to :recipe_blog
    belongs_to :blog_post
end
