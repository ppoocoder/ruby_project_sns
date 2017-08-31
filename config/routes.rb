Rails.application.routes.draw do
  
  
  resources :blog_posts
  devise_for :users
  
  #get 'home/main'
  
  resources :pins, except: [:show] do
    post "/like", to: "likes#like_toggle"
    resources :comments, only: [:create, :destroy]
  
  end
  
  get "pins/hashtag/:name", to: "pins#hashtags"
  
  
  resources :recipe_blogs do
    post "/like", to: "likes#like_toggle"
    resources :comments, only: [:create, :destroy]
  end  
  
  get "recipe_blogs/hashtag/:name", to: "recipe_blogs#hashtags"
  
  post '/tinymce_assets' => 'tinymce_assets#create'

  
  resources :follows, only: [:create, :destroy]
  
  root 'home#main'
  resources :blog_posts do
      post "/like", to: "likes#like_toggle"
      resources :comments, only: [:create, :destroy]
  end
  
  resources :rooms do
     root to: 'rooms#show'
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   mount ActionCable.server => '/cable'
end
