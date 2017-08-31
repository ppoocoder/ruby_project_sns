class LikesController < ApplicationController
  before_action :authenticate_user!                                                #회원로그인 권한 부여 :좋아요 

  def like_toggle                                                                  #유저의 좋아요 활동에 대한 토글키 ( user.id와 pin.id로 구분)
     
    like = Like.find_by(user_id: current_user.id,
                              pin_id: params[:pin_id]) 
    
    
    like = Like.find_by(user_id: current_user.id, recipe_blog_id: params[:recipe_blog_id])
    
    like = Like.find_by(user_id: current_user.id, blog_post.id: params[:blog_post_id])
      
      if like.nil?     #&& like(pin_id).nil? 
          
             like = Like.create(user_id: current_user.id,
                                 pin_id: params[:pin_id]) 
                  
              like = Like.create(user_id: current_user.id, recipe_blog_id: params[:recipe_blog_id])
              
                  
              like = Like.create(user_id: current_user.id, blog_post_id: params[:blog_post_id])
        
      # elsif like.nil? && like(recipe_blog_id).nil?
      else 
            like.destroy
      end
        
    

    redirect_to :back
  end

end
