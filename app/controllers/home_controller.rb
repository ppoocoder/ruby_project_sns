class HomeController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]                                   
  # before_action :authenticate_user!, except: [:root]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def main                                                                    
     @pins = Pin.all.order('created_at desc')                                           #pin을 최신순으로 불러오기 
  end


  private
      # Use callbacks to share common setup or constraints between actions.
      def set_pin                                                                              
        @pin = Pin.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def pin_params                                                                              #pin 작성에는 설명글과 사진의 값이 필요 
        params.require(:pin).permit( :p_description, :pin_image)
      end
  
      def correct_user                                                                        #유저 권한설정
        @pin = current_user.pins.find_by(id: params[:id])
        redirect_to root_path, notice:"Not authorized to edit this pin" if @pin.nil?
      end


end
