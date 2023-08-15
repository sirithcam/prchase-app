Rails.application.routes.draw do
  namespace :api do
    resources :purchase_intents, only: %i[create destroy show index]
  end
end
