require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  get 'dashboard/show'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    root to: "dashboard#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root to: "home#index"
  end
end
