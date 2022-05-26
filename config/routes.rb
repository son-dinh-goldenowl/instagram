Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users, :controllers => {
      :registrations => 'users/registrations',
      :sessions => 'users/sessions'
    }

    devise_scope :user do
      authenticated :user do
        root 'static_pages#home', as: :authenticated_root
      end

      unauthenticated do
        root 'devise/sessions#new'
      end
    end
    resources :users
    post 'upload-avatar', to: 'users#upload_avatar'
    post 'destroy-avatar', to: 'users#destroy_avatar'
  end
end
