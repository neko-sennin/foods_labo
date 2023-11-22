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
    resources :tags, only: [:create,:index, :edit, :update, :destroy]
    resources :categories, only: [:create,:index, :edit, :update, :destroy]
    resources :ingredients, only: [:create, :index, :edit, :update, :destroy]
    resources :contacts, only: [:index, :show, :edit, :update, :destroy] 
  end
  
  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
    resource :users, only: [:edit, :update]
    resource :likes, only: [:create, :destroy]
    
    get 'users/my_page' => 'users#show'
    get '/users/check' => 'users#check'
    post '/users/withdraw' => 'users#withdraw'
    
    resources :users do
      get '/likes' => 'users#likes'
    end
    
    resources :foods, only: [:index, :show]
    resources :reviews, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :contacts, only: [:new, :create]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'done', to: 'contacts#done', as: 'done'
    get 'tags/index' => 'tags#index'
    get 'categories/index' => 'categories#index'
    get 'ingredients/index' => 'ingredients#index'
    get "search" => "reviews#search"
    get 'reviews/ranking' => 'reviews#ranking'
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
