Rails.application.routes.draw do
  root 'chads#index'
  resources :introductions, only: [:index]
  resources :missions, only: [:index]
  resources :contacts, only: [:new, :create]
  resources :actions, only: [:index]
  resources :trails, only: [:index]
  resources :members, only: [:index]
  resources :kisei, only: [:index] do
    resources :users, only: [:index]
  end

  namespace :admin do
    resources :adkiseis do
      resources :admin_users
    end
  end

  namespace :admin do
    resources :adcontacts
  end

  namespace :admin do
    root 'addashboard#index'
  end




  get '/actions/sports',        to: 'sports#index'
  get '/actions/educations',    to: 'educations#index'
  get '/trails/trip',           to: 'trips#index'
  get '/trails/pr',             to: 'prs#index'
  get '/trails/fundraising',    to: 'fundraisings#index'
  get '/trails/crowdfunding',   to: 'crowdfundings#index'
  get 'trails/others',          to: 'others#index'

#------以下、admin側のパス-------#
  get '/admin/kiseis',          to: 'admin/adkiseis#index'
  get '/admin/users',           to: 'admin/adusers#index'
  get '/admin/contacts',        to: 'admin/adcontacts#index'
  get '/admin/kiseis/new',      to: 'admin/adkiseis#new'
  get '/admin/users/new', to: 'admin/adusers#new'
end
