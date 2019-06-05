Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#welcome'
  resources :shows
  resources :users do
    resources :reviews
  end
end
