Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :topics

  resource  :interests

  root to: 'topics#index'

end
