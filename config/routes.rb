Rails.application.routes.draw do
  devise_for :adminusers
  resources :contacts, only: [:new, :create]
  resources :fb_login, only: %i[index]

  namespace :admin do
    resources :adkiseis
    resources :adusers do
      collection do
        get 'search'
      end
    end
    resources :adcontacts, only: [:index]
    resources :adcalenders, only: [:index]
    resources :addashboard, only: %i[index]
    # root 'fb_login#index'
    root 'addashboard#index'
  end

  # root 'admin/fb_login#index'


  scope '/auth' do
    get '/callback' => 'auth#callback'
  end

#------以下、admin側のパス-------#
  get '/admin/kiseis',          to: 'admin/adkiseis#index'
  get '/admin/users',           to: 'admin/adusers#index'
  get '/admin/contacts',        to: 'admin/adcontacts#index'
  get '/admin/kiseis/new',      to: 'admin/adkiseis#new'
  get '/admin/users/new',       to: 'admin/adusers#new'
  get '/admin/slack/post',      to: 'admin/adusers#notify_to_slack'
end
