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

  post "new_friendship", to: "friendships#create", as: :new_friendship
  #post "accept_challenges/:id", to: "user_challenges#create", as: :user_challenges

  get "accept_friendship/:friend_id", to: "friendships#accept", as: :accept_friendship
  get "decline_friendship/:friend_id", to: "friendships#decline", as: :decline_friendship

  post "accept_challenges/:id", to: "user_challenges#accept", as: :accept_challenge
  post "complete_challenges/:id", to: "user_challenges#complete", as: :complete_challenge

  resources :user_challenges, only: :destroy


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
