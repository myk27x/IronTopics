Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :topics #do
    resource  :interests
  # end

  root to: 'topics#index'

  get 'search', to: 'topics#search'

end
