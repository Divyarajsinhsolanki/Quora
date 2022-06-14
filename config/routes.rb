Rails.application.routes.draw do

devise_for :users 

  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/about'
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


# devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

# devise_scope :user do
#   get 'sign_in', to: 'devise/sessions#new'
  
#   end
# devise_for :users, skip: :all

# devise_for :users do
#   get '/users/sign_out' => 'devise/sessions#destroy'
# end
# devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }  

  # devise_for :users, controller: 
  #   {
  #     sessions: 'users/sessions'  
  #   }

  # devise_scope :user do
  #   get "users", to: "devise/sessions#new"
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  
 # devise_scope :user do
 #    get "users", to: "devise/sessions#new"
 #  end
  
  # devise_for :users
  

 end
