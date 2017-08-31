class TinymceImagesController < ApplicationController
    def new
    @tinymce_image = TinymceImage.build.params(tinymce_image_params)
  end
 
  def show
    @tinymce_image = TinymceImage.find(params[:id])
  end
 
  private
 
  def tinymce_image_params
    params.require(:tinymce_image).permit(
      :file,
      :hint,
      :alt,
      )
  end
end
