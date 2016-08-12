Rails.application.routes.draw do
  get 'main/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'main#index'

  resources :long_goals do
    resources :short_goals
  end

  resources :users
  resource :session
end
