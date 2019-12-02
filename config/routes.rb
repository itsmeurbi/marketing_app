# frozen_string_literal: true

Rails.application.routes.draw do
  resources :coworkers
  resources :posts
  resources :nodes
  resources :clients
  resources :campains
  resources :companies
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'landing_page#index'
end
