class RecipeBlog < ActiveRecord::Base
    belongs_to :user
                                                                               
    has_many :ingrediants                                                           
    has_many :directions 
    has_many :trivia_knows
    #like 기능 
    has_many:likes                                                          #magration of create_likes likes 값들을 가질수 있음                        
    has_many :liked_users, through: :likes, source: :user     
    
    
    
    has_and_belongs_to_many :tags
    
   
    after_create do 
    
         recipe_blog = RecipeBlog.find_by(id: self.id)
             hashtags = self.r_description.scan(/#[[:alnum:]_]+/)   
             hashtags.map do |hashtag|   
                 tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
                 recipe_blog.tags << tag
             end    
         ingrediants = Ingrediant.find_by(recipe_blog_id: :recipe_blog_id)
             hashtags = ingrediants.name.scan(/#[[:alnum:]_]+/)   
              hashtags.map do |hashtag|   
              tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
                 ingrediants.tags << tag
              end
     end
    before_update do
         recipe_blog = RecipeBlog.find_by(id: self.id)
             recipe_blog.tags.clear
             hashtags = self.r_description.scan(/#[[:alnum:]_]+/)   
             hashtags.map do |hashtag|   
                 tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
                 recipe_blog.tags << tag
             end    
        ingrediants = Ingrediant.find_by(recipe_blog_id :recipe_blog_id)
             ingrediants.tags.clear
             hashtags = ingrediants.name.scan(/#[[:alnum:]_]+/)   
              hashtags.map do |hashtag|   
              tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
                 ingrediants.tags << tag
              end
    end
    
    
    
    has_many :comments       
    
    
                                       # 페이지 안에서 변수 입력을 바로 추가 할수 있는  기능  관계  설정 
    accepts_nested_attributes_for :ingrediants,
                                   reject_if: proc { |attributes| attributes['name'].blank? },
                                   allow_destroy: true
    accepts_nested_attributes_for :directions,
                                   reject_if: proc { |attributes| attributes['cooking_recipe'].blank? },
                                   allow_destroy: true
    accepts_nested_attributes_for :trivia_knows,
                                   reject_if: proc { |attributes| attributes['title'].blank? } && proc { |attributes| attributes['content'].blank? },
                                   allow_destroy: true                               
                                   
                                                                  
                                   
    validates :title, :r_description, :blogs_main_pic, :blogs_dish_pic, presence: true
 
    mount_uploader :blogs_main_pic, BlogImageUploader                   #메인 사진 업로더  추가 
    
    mount_uploader :blogs_dish_pic, BlogImageUploader                       #완성된 사진 업로더 추가  
end
