class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 has_many :pins
 has_many :likes
 
 has_many :liked_pins, through: :likes, source: :pin
 has_many :liked_recipe_blogs, through: :likes, source: :recipe_blog
 has_many :blog_posts
 
 has_many :recipe_blogs
 
 mount_uploader :avatar, AvatarUploader

 has_many :comments


 #팔로워
 
  # 관계 이름 : follower_relations(다른 이름으로 변경 가능)
  # 외래키 : followed_id
  # 모델명 : Follow
 
  # 관계 이름 : followers (다른 이름으로 변경 가능)
  # follow_relations를 통해 가져올 값 : follower ( follow.follower )
  
  #팔로잉
  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  has_many :followers, through: :follower_relations, source: :follower

  has_many :following_relations, foreign_key: "follower_id", class_name: "Follow"
  has_many :followings, through: :following_relations, source: :followed

  def is_like?(pin)
        Like.find_by(user_id: self.id, pin_id: pin.id).present? 
  end
  
  def is_like?(recipe_blog)
  
         Like.find_by(user_id: self.id, recipe_blog_id: recipe_blog.id).present?
      
  end
  
  def is_like?(blog_post)
      
      Like.find_by(user_id: self.id, blog_post_id: blog_post.id).present?
  end
end