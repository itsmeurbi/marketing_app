# frozen_string_literal: true

Rails.application.routes.draw do
  resources :companies
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'landing_page#index'
  resources :corporations
end
