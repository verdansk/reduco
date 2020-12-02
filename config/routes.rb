Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users do
    resources :surveys
    resources :houses
    resources :transports
  end
   post "accept_challenges/:id", to: "user_challenges#create", as: :user_challenges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
