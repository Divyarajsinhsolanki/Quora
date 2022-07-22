Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'

  resources :users do
    member do
      get :following, :followers
      get :followingtopic, :followersoftopic
    end
  end

  resources :topics do
    get '/page/:page', action: :index, on: :collection
  end

  resources :profile
  resources :questions
  resources :answers
  resources :topic_relations, only: %i[create destroy]
  resources :relationships,   only: %i[create destroy]
  
  post '/readcsv' => 'questions#readcsv'
  post 'stripe_checkout' => 'subscription#stripe_checkout'
  get '/billing' => 'billing#index', as: :billing
  get '/card/new' => 'billing#new_card', as: :add_payment_method
  post '/card' => 'billing#create_card', as: :create_payment_method
  get '/success' => 'billing#success', as: :success
  post '/subscription' => 'billing#subscribe', as: :subscribe
  resources :charges, only: [:new, :create]
  post 'charges/create' => 'charges#create', as: "charges_create"
  post 'checkout/create' => 'checkout#create', as: "checkout_create"
  get  'transaction/success' => 'transaction#success', as: "transaction_success"

  require 'sidekiq/web'
  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end
  mount Ckeditor::Engine => '/ckeditor'
  mount Stripe::Engine => '/stripe'

end