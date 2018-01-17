Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :sessions, :approvals

  root 'sessions#new'
  match '/signout' => "sessions#destroy", via: [:get, :post]
end
