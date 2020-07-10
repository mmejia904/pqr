Rails.application.routes.draw do
  #Route for index 
  get 'welcome/index'
  
  resources :inquiries do
    resources :followups
  end

  #Define landing index route
  root 'welcome#index'

end
