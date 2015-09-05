Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations'}

  #get '/track/:id', to: 'tracks#show'
  resources :artists
  get ':username', to: 'artists#show', as: 'static_artist' 
  scope path: '/:username', as: 'artist' do
    resource :releases 
    resource :tracks
  end

  #refactor this route
  resources :users do
    resource :profile
  end


  get '/about' => 'pages#about'
  root 'pages#home'

end
