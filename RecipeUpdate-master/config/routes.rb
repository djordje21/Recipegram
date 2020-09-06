# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :recipes do
    member { post :vote }
    resources :comments do
      member { post :vote }
    end
  end
  root 'recipes#index'
end
