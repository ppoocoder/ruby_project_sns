class BlogPost < ApplicationRecord
 validates_presence_of :b_description

    belongs_to :user
    has_many:likes                                                          #magration of create_likes likes 값들을 가질수 있음                        
    has_many :liked_users, through: :likes, source: :user     
    has_many :trivia_knows
    has_many :comments         

end
