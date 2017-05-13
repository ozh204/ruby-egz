Rails.application.routes.draw do

  root 'welcome#index'

  resources :shops
  resources :orders

  resources :waffles do
    collection do
      delete 'destroy_multiple'
    end
  end

  delete '/removeImage/:id',  to: 'waffles#removeImage', as: 'removeImage'

  get  '/signup',  to: 'users#new'
  resources :users do
    collection do
      delete 'destroy_multiple'
    end
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
