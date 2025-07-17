Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'pricing', to: 'pages#pricing'
  get 'features', to: 'pages#features'

  resources :users
  resources :sessions
  resource :company, only: [:edit, :update]
  resource :settings, only: [:edit, :update]
  resources :tax_codes
  scope module: :sales do
    resources :customers
  end
  scope module: :purchase do
    resources :suppliers
  end
  resources :items
  resources :invoices
  resources :bills
  resources :accounts
  resources :journal_entries
  resources :employees do
    resources :payslips
  end
  resources :commissions, only: [:index]
  resources :leads do
    resources :opportunities
  end
  resources :pipelines

  resources :reports, only: [:index] do
    collection do
      get 'trial_balance'
      get 'profit_and_loss'
      get 'balance_sheet'
    end
  end

  root 'dashboard#index'
end
