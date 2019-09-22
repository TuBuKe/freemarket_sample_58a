Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    delete 'destroy' => 'devise/sessions#destroy',as: :current_user_destroy
  end
  
  # ユーザー
  resources 'users', except: [:show, :edit] do
    collection do
      get 'credit_register'
      get 'show'
      get 'edit'
      get 'logout'
      get 'edit_profile'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mercaris#index'

  # products
  resources 'products'
  root 'products#new'

  resources :signin ,only: [:new,:create,:index]

  resources :signup ,only: [:index,:create] do
    collection do
      get 'registration'
      post 'registration' => 'signup#first_validation'
      get 'sms_authentication' 
      post 'sms_authentication' => 'signup#sms_post'
      get 'sms_confirmation' 
      post 'sms_confirmation' => 'signup#sms_check'
      get 'address' 
      post 'address' => 'signup#second_validation'
      get 'creditcard'
      get 'done'
    end
  end
end
