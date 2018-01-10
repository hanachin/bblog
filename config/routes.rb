Rails.application.routes.draw do
  constraints(year: /\d{4}/, month: /\d{1,2}/, mday: /\d{1,2}/) do
    get 'baby/:year/:month/:mday', to: 'baby_logs#index'
    post 'baby/bath_logs', to: 'bath_logs#create'
    post 'baby/breast_milk_logs', to: 'breast_milk_logs#create'
    post 'baby/milk_logs', to: 'milk_logs#create'
    post 'baby/pee_logs', to: 'pee_logs#create'
  end
end
