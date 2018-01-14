Rails.application.routes.draw do
  root to: 'babies#new'

  post 'verification_emails', to: 'verification_emails#create'

  constraints(year: /\d{4}/, month: /\d{1,2}/, mday: /\d{1,2}/) do
    get 'baby/:year/:month/:mday', to: 'baby_logs#index', as: :baby_logs
    post 'baby/bath_logs', to: 'bath_logs#create'
    post 'baby/breast_milk_logs', to: 'breast_milk_logs#create'
    post 'baby/milk_logs', to: 'milk_logs#create'
    post 'baby/pee_logs', to: 'pee_logs#create'
    post 'baby/poo_logs', to: 'poo_logs#create'
  end
end
