Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: 'homes#top'
  devise_for :users

  resources :post_images, only: [:new, :index, :show]

  get "/homes/about" => "homes#about", as: "about"

end
