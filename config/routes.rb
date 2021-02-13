Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :create]
  get "posts/dashboard", to: "posts#new"
  root 'posts#index'
end
