class FollowsController < ApplicationController
  before_action :authenticate_user!                                             #좋아요 기능 

  def create                                                                      #좋아요 생성
    Follow.create(followed_id: params[:followed_id],
                  follower_id: current_user.id)
    redirect_to :back
  end

  def destroy                                                                        #좋아요 삭제
    Follow.find_by(followed_id: params[:id],
                   follower_id: current_user.id).destroy
    redirect_to :back
  end



end
