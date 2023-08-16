Rails.application.routes.draw do
  namespace :api do
    resources :purchase_intents, only: %i[create destroy show index]

    resources :purchases, only: [:index, :create]

    post '/purchase_intents/process_purchase', to: 'purchase_intents#process_purchase'
  end
end
