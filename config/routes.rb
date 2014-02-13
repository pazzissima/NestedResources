NestedResources::Application.routes.draw do
  devise_for :users

  resources :posts, only: [:index, :new, :create, :show]
  resources :comments, only: [:show, :index, :new, :create]
  root to: 'posts#index'
end
