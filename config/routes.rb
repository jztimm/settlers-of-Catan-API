Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "static#home"

  # resources :sessions, only: [:create]
  # resources :registrations, only: [:create]
  # delete

  namespace 'api' do
    namespace'v1' do
      resources :users
    end
  end

end
