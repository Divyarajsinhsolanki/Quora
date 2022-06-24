Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

# devise_for :users 
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }



  root'static_pages#home'
  get 'static_pages/help'
  get  'static_pages/about'
  get 'static_pages/contact'
 
  resources :users do
    member do
      get :following, :followers
      get :followingtopic, :followersoftopic
    end
  end
  

  resources :profile

  resources :topics do
  get '/page/:page', action: :index, on: :collection
  end

  resources :questions 
  resources :answers
  
  resources :topic_relations, only: [:create, :destroy]
  resources :relationships,   only: [:create, :destroy]



end