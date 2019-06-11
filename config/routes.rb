Rails.application.routes.draw do

  devise_for :users
   root 'pages#home'
     get "/pages/:page" => "pages#show"
  resources :physicians do
    resources :appointments
  end
  resources :patients do 
  resources :appointments
  end
end
