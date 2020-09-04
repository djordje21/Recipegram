# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :recipes do
    	resources :comments
  	end
  root 'recipes#index'
end
