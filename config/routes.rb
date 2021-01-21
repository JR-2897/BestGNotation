Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :platforms
  resources :categories
  resources :studios
  resources :games do
    resources :reviews
  end
  # get 'game/:game_id/reviews/new', to: 'reviews#new_review_from_game', as: 'new_game_review'
end
