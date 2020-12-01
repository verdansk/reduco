Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :user do
    resources :surveys
    resources :houses
    resources :transports
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
