Rails.application.routes.draw do
  
  root to: 'pages#home'
  
  get '/welcome(/:name)', to: 'pages#welcome', as: 'welcome' 
  
  get '/team', to: 'pages#team', as: 'team' 

  get '/contact', to: 'pages#contact', as: 'contact' 

  get '/grossebalances/:id', to: 'pages#author', as: 'author' 

  resources :ragots do
    resources :comments
  end
end
