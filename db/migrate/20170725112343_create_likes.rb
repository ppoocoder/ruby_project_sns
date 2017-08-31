class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
        t.belongs_to :user
        t.belongs_to :pin 
        t.belongs_to :recipe_blog
        t.belongs_to :blog_post
        # counter_cache 기능을 사용하기 위해 필요한 컬럼
         # Like 모델을 카운팅할 것이기 때문에 이름은 likes_count
        t.integer :likes_count
      t.timestamps 
    end
  end
end
