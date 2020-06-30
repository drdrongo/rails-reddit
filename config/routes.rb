Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :show, :new, :create, :destroy, :edit, :update ]

  resources :users, only: [:show, :new, :create]

end
