class CommentsController < ApplicationController
  before_action :authenticate_user!                                        #로그인 했는지 확인               
  before_action :check_ownership!, only: [:update, :destroy]                  # 작성자이라면 업데이트와 삭제 가능

  def create                                                                 #댓글 생성 
    new_comment = Comment.create(content: params[:content],                         #댓글, 작성글의 id 
                              pin_id: params[:pin_id],                                 #작성자 id      
                              user_id: current_user.id)         
    
    
    new_comment = Comment.create(content: params[:content],                         #댓글, 작성글의 id 
                              recipe_blog_id: params[:recipe_blog_id],                                 #작성자 id      
                              user_id: current_user.id)         
                              
                              
    new_comment = Comment.create(content: params[:content],                         #댓글, 작성글의 id 
                              recipe_blog_id: params[:blog_post_id],                                 #작성자 id      
                              user_id: current_user.id)         
               
 
    redirect_to :back
  end
  
  def destroy                                                                     #댓글 삭제
    @comment.destroy
    redirect_to :back
  end
  private
  def check_ownership!                                                                #댓글 작성자 체크 
    @comment = Comment.find_by(id: params[:id])
    redirect_to root_path if @comment.user.id != current_user.id                        #작성자가 아닐시 업데이트 삭제 방지                
  end

end
