Rails.application.routes.draw do
  # /cocktails/23/doses/new

  resources :cocktails, only: [:show, :index, :new, :create] do
    resources :doses, except: [:index, :update, :edit, :show]
  end

  root "cocktails#index"
end
