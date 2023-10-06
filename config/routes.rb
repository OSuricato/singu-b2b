Rails.application.routes.draw do
  root to: "pages#home"
  get "/contato", to: "pages#contato"
  get "/sobre", to: "pages#sobre"
  get "/solucoes", to: "pages#solucoes"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
