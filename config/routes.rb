Rails.application.routes.draw do
  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'chats/show'
  end
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'

  namespace :public do
    get "/user/:id" => "users#show"
    get '/users/my_page' => 'users#mypage', as: 'my_page'
    resources :users, only: [:index, :edit]

    resources :post_images, only: [:new, :index, :show]

    get 'chat/:id', to: 'chats#show', as: 'chat'
    resources :chats, only: [:create]
  end


  devise_for :users








end
