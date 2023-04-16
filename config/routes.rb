Rails.application.routes.draw do
  resources :posts
  get 'index', to: 'home#index'
  post 'post_example', to: 'home#post_example'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
