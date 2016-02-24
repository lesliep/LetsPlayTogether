require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :profiles

  resources :friendships, only: [:create, :update, :destroy]

  get "/auth/:provider/callback" => "social_media_accounts#create"
  get "/auth/failure" => "social_media_accounts#failure"

  constraints Monban::Constraints::SignedIn.new do
    root to: "dashboard#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root to: "home#index"
  end

end
