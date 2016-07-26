Rails.application.routes.draw do
  get 'public/index'
  post '/search', to: 'search#search'


  root to: 'public#index'
end
