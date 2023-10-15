Rails.application.routes.draw do
  root to: "pages#home"

  get "/about", to: "pages#about", as: 'sobre'

  resources :solutions, only: [:index, :show], as: 'solucoes'
  resources :contacts, only: [:new, :create]
end
