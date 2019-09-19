# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :companies
    resources :corporations
    root to: 'companies#index'
  end

  namespace :rrhh do
    resources :users
    root to: 'users#index'
  end

  namespace :manage do
    resources :campains
    root to: 'campains#index'
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  root 'landing_page#index'
end
