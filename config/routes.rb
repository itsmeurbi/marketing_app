# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :clients
    resources :contacts
    resources :campains, except: %i[destroy]
    resources :users, except: %i[edit]
    root to: 'campains#index'
  end

  namespace :rrhh do
    resources :users, except: %i[destroy]
    root to: 'users#index'
  end

  namespace :finance do
    resources :companies, except: %i[destroy]
    resources :corporations, except: %i[destroy]
    root to: 'companies#index'
  end

  namespace :community do
    resources :campains, only: %i[index show] do
      resources :coworkers
    end
    root to: 'campains#index'
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  root 'landing_page#index'
end
