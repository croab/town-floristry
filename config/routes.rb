Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/donations", to: "pages#donations"
  get "/contact", to: "pages#contact"
  resources :events
  resources :discussions do
    resources :messages, only: [:create]
  end
end
