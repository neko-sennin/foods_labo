Rails.application.routes.draw do
  
 
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :user, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :admin do
    get '/' => 'homes#top'
    resources :foods, only: [:new, :create,:index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end
  
  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :users, only: [:edit, :update]
    get 'users/my_page' => 'users#show'
    resources :foods, only: [:index, :show]
    resources :reviews, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    get 'likes/index' => 'likes/index'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
