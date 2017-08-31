module PinsHelper
   def p_render_with_hashtags(p_description) 
   
      p_description.gsub(/#[[:alnum:]_]+/){|word| link_to word, "/pins/hashtag/#{word.delete('#')}"}.html_safe
   end 

end
