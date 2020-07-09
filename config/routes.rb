Rails.application.routes.draw do
  #Route for index 
  get 'welcome/index'
  
  resources :inquirys

  #Define landing index route
  root 'welcome#index'

end
