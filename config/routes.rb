Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users

    devise_scope :user do
      authenticated :user do
        root 'static_pages#home', as: :authenticated_root
      end

      unauthenticated do
        root 'devise/sessions#new'
      end
    end
    resources :users, only: [:show]
    post 'validate-email-user', to: 'users#validate_email_user'
  end
end
