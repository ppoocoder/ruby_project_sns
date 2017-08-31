class Pin < ActiveRecord::Base
    validates_presence_of :p_description                                                            
    belongs_to :user                                                       #user에 속함 
    has_many:likes                                                          #magration of create_likes likes 값들을 가질수 있음                        
    has_many :liked_users, through: :likes, source: :user                     #user 활동에 의한 likes를 통해 좋아요된 like값들을 가짐 
    mount_uploader :pin_image, PinImageUploader                                                     #pin_image 이미지업로더를 추가 
    
    
    has_and_belongs_to_many:tags
    after_create do 
    
         pin =Pin.find_by(id: self.id)
         hashtags = self.p_description.scan(/#[[:alnum:]_]+/)
         hashtags.map do |hashtag|   
             tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
             pin.tags << tag
         end
    end
 
    before_update do
     
      pin = Pin.find_by(id: self.id)
      pin.tags.clear 
      hashtags = self.p_description.scan(/#[[:alnum:]_]+/)
      hashtags.map do |hashtag|
         tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
         pin.tags << tag
      end
    end     

    
    
    has_many :comments                                                             #cooments 요소 포함 
    
end
