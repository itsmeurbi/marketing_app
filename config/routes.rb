# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :companies
    resources :corporations
    resources :campains

    root to: 'users#index'
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  root 'landing_page#index'
end
