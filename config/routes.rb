Rails.application.routes.draw do
  get 'public/index'

  root to: 'public#index'
end
