Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users do
    member do
      post :search
    end
    resources :surveys
    resources :houses
    resources :transports
  end

  post "accept_challenges/:id", to: "user_challenges#accept", as: :accept_challenge
  post "complete_challenges/:id", to: "user_challenges#complete", as: :complete_challenge

  get "/users/:id/friendships/:user_id", to: "friendships#create", as: :new_friendship
  post "/users/:id/friendships/:user_id", to: "friendships#create"
  # post "accept_challenges/:id", to: "user_challenges#create", as: :user_challenges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
