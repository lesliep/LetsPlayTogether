require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :profiles

  get "/auth/:provider/callback", to: "social_media_accounts#create"

  constraints Monban::Constraints::SignedIn.new do
    root to: "dashboard#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root to: "home#index"
  end

end
