Rails.application.routes.draw do

  get '/' => "home#top"
  
  get 'users/new' => "users#new"
  post 'users/create' => "users#create"

  get 'login' => "users#login_form"
  post 'login' => "users#login"
  post 'logout' => "users#logout"

  get 'users/:id/edit' => "users#edit"
  post 'users/:id/update' => "users#update"
  get 'users/:id' => "users#mypage"


  get 'posts/new' => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
