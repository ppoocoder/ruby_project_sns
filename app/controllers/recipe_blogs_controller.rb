class RecipeBlogsController < ApplicationController
    
    before_action :find_recipe_blog, only: [:show, :edit, :update, :destroy]
    
    
    def index
        @recipe_blogs = RecipeBlog.all
        @ingrediants =Ingrediant.all
        
    end
    
    def show
        @direction = find(id: params[:id])
    end
    
    def hashtags
        tag = Tag.find_by(name: params[:name]) 
        @recipe_blogs = tag.recipe_blogs
        @ingrediants = tag.ingrediants
        
        
    end
    
    
    def new                                                                             #레세피 생성
      @recipe_blog = current_user.recipe_blogs.build
      
    end      
  
    def create                                                                                #레시피 생성  
      @recipe_blog = current_user.recipe_blogs.build(recipe_blog_params)    
     
       if @recipe_blog.save
           redirect_to @recipe_blog, notice: "레시피를 등록했습니다."
       else
            render 'new'
       end    
    end
    
    def edit                                                                              #레시피 수정
    end

    def update                                                                           #레시피 수정
       if @recipe_blog.update(recipe_blog_params)
          redirect_to @recipe_blog
       else
           render 'edit'
       end
    end
    
    def destroy
      @recipe_blog.destroy
      redirect_to pins_path, notice:"성공적으로 게시글이 삭제 되었습니다."
    end
   
    private
    
    def recipe_blog_params                                                                          #레시피 필수요소 와 그 관계 설정
        params.require(:recipe_blog).permit(:title,:country, :r_description, :blogs_main_pic, :blogs_dish_pic, ingrediants_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step,:cooking_recipe, :blogs_cooking_pic, :_destroy], 
         triviaKnows_attributes: [:id,:title,:content,:_destroy])
        
    end
    
    def find_recipe_blog                                                                         #레시피 id값으로 식별
        @recipe_blog = RecipeBlog.find(params[:id])
    end
    
end
