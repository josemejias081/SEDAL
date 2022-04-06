Rails.application.routes.draw do
  devise_for :users, :path => 'identities'
  
  root to: "home#welcome"
  get "home", to: "home#welcome"
  get "/home/admi", to: "home#admi"

  resources :evaluations do
    resources :items

  end

  resources :items do 
    resources :answers 
  end 

  resources :scales do
    resources :answers 
  end
  
  resources :users

  resources :tests

  resources :groups


  get "/notification/group/:group_id", to: "notifications#evaluation", as: "evaluation_notif"

  get "/picture/photo", to: "pictures#photo"

end
