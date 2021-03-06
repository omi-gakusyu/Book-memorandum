Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:show, :new, :create] do
    member do
      get :favorites
    end
  end
  
  resources :books, only: [:new, :create] do
    collection do
      post :search
    end
  end
      
  resources :impressions, except:[:index] do
    collection do
      get :same_books
    end
  end
  
  resources :favorites, only:[:create, :destroy]
end
