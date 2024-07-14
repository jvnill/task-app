Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks, except: %i[show] do
    member do
      put :finish
    end
  end
end
