Rails.application.routes.draw do

 root 'pages#home'
  get "/pages/:page" => "pages#show"

  resources :physicians do
    resources :appointments
  end

  resources :patients do 
    resources :appointments
  # , only: [:index, :new, :create, :destroy ]
  end
end
