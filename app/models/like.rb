class Like < ActiveRecord::Base
    belongs_to :user
    # counter_cache를 true로 설정하면 네이밍 규칙에 따라
    # Post 모델의 likes_count 컬럼으로 설정
    belongs_to :pin, counter_cache: true
    belongs_to :recipe_blog, counter_cache: true
    belongs_to :blog_post, counter_cache: true
end
