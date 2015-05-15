Rails.application.routes.draw do
  resources :urls

  get '/top100' => 'urls#top100'

  root 'urls#new'
end
