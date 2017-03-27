Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end