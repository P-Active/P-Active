Rails.application.routes.draw do
  get 'home/show'

  get 'sessions/create'

  get 'sessions/destroy'

  root to: 'home#show'
  get 'home', to: 'home#show'

  get 'login', to: redirect('/auth/google'), as: 'login'
  get '/auth/google/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
