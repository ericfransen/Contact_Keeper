Rails.application.routes.draw do
  root "contacts#index"
  resources :contacts, :defaults => {:format => "json"}
end
