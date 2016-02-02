Rails.application.routes.draw do
  root 'static_pages#splash'
  resources :rates
  resources :boarding_passes, only: [:new, :create, :update]
  get 'payments/new' => 'payment_processor_simulators#new', as: 'new_payment'
  post 'checkout' => 'payment_processor_simulators#create'
  post 'payments/checkout' => 'payment_processor_simulators#checkout'
  get 'confirmation' => 'payment_processor_simulators#confirmation'
  resources :customers, only: [:new, :create, :update]
end
