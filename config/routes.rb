# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  namespace :admin do
    root to: 'home#index'

    resources :financial_entries, only: [:index, :new, :create]
  end
end
