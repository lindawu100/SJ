Rails.application.routes.draw do

  resources :wallet, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :wallet, only: [] do
        member do
          post 'transaction' => 'wallet#transaction'
        end
      end
    end
  end

end
