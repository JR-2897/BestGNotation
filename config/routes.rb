Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: 'home'
  get 'search', to: 'pages#search', as: 'search_page'
  get 'dashboard', to: "pages#dashboard", as: 'dashboard_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :platforms
  resources :categories
  resources :studios
  resources :games do
    resources :reviews
  end
end
