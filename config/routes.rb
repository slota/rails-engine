Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, default: { format: :json }
      resources :invoice_items, default: { format: :json }
      resources :invoices, default: { format: :json }
      resources :items, default: { format: :json }
      resources :merchants, default: { format: :json }
      resources :transactions, default: { format: :json }
    end
  end
end
