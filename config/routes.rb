Rails.application.routes.draw do
  resources :physicians do
    resources :appointments
  end
  resources :patients
end
