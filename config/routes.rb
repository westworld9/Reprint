Rails.application.routes.draw do
  
  root "posts#index"
  devise_for :users
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
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
