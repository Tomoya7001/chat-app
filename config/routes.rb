Rails.application.routes.draw do
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
    resources :post_images, only: [:new, :index, :show]
  end


  devise_for :users





end
