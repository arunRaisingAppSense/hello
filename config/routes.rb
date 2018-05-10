Rails.application.routes.draw do
  
  #devise_for :users
  #devise_for :users, :controllers => { :invitations => 'users' }
  devise_for :users, :controllers => { :registrations => 'registrations' }
  get 'home/index'
  root to: "resumes#index"
  resources :resumes, only: [:index, :new, :create, :destroy]
  resources :photos 
  
  resources :actors do
    resources :comments, module: :actors
  end

  resources :films do
    resources :comments, module: :films
  end
  
  #get 'comments/destroy'
  resources :comments
  resources :candies
  resources :kids
  resources :appointments
  resources :physicians
  resources :patients

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
