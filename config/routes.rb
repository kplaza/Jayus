Rails.application.routes.draw do
  devise_for :students
  devise_for :users
  resources :posts do
  resources :comments
  end
root 'posts#index'




get '/' => 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


get 'posts/index', as: 'user_root'

get "/users/:id" =>  "users#show", as: "user"


end
