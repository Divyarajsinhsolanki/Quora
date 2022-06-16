Rails.application.routes.draw do

 
devise_for :users 

  root'static_pages#home'
  get 'profile/index'
  get 'profile/show'
  get 'static_pages/help'
  get  'static_pages/about'
  get 'static_pages/contact'
 
  resources :users do
    resources :topics  
    resources :questions
  end
    
  resources :users do
    resources :questions do
      resources :answers
    end
  end

  resources :users do
    member do
      get :following, :followers
      get :followingtopic, :followersoftopic
    end
  end

 # devise_for :users, controllers: {
 #        sessions: 'users/sessions'
 #      }
 
  resources :topic_relations, only: [:create, :destroy]
  resources :relationships,   only: [:create, :destroy]

end