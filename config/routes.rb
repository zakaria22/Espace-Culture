Rails.application.routes.draw do
  
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'stat' => 'statistics#plot'
  get 'cv/:id' => 'statistics#cv'
  get 'list' => 'statistics#list'

  devise_for :users
  resources :users

  resources :books do 
    resources :reviews
  end
  
  resources :movies do 
    resources :comments
  end

end
