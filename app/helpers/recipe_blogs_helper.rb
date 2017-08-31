module RecipeBlogsHelper
  def r_render_with_hashtags(r_description)
   
    r_description.gsub(/#[[:alnum:]_]+/){|word| link_to word, "/recipe_blogs/hashtag/#{word.delete('#')}"}.html_safe
  end 
  def render_with_hashtags(name)
   
     @ingrediants.name.gsub(/#[[:alnum:]_]+/){|word| link_to word, "/recipe_blogs/hashtag/#{word.delete('#')}"}.html_safe
  end 
  
      

end
