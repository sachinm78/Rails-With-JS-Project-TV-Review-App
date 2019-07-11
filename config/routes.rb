Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'application#welcome'

  resources :reviews
  resources :users do
    resources :shows
  end

  get '/custom_query', to: 'reviews#custom_query'
  get 'reviews/:id/next', to: 'reviews#next'
end
