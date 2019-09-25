Rails.application.routes.draw do
  
  root "posts#index"
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  resources :posts, except: [:edit] do
    member do
      get 'description'
      
      get 'photo_upload'
        
      get 'video'
    end 
    resources :photos, only:[:create, :destroy]
    resources :comments, only:[:index, :create, :destroy]
    resources :favorites, only:[:create, :destroy], shallow: true
  end
  
  resources :users, only:[:show]

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount ActionCable.server => '/cable'
end
