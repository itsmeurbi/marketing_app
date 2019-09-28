# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :campains
    root to: 'campains#index'
  end

  namespace :rrhh do
    resources :users
    root to: 'users#index'
  end

  namespace :manage do
    resources :campains
    root to: 'campains#index'
  end

  namespace :finance do
    resources :companies
    resources :corporations
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  root 'landing_page#index'
end
