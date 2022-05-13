# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # def new
  #   super
  # end

  # def create
  #   super
  # end

  # def edit
  #   super
  # end

  def destroy
    return super if current_user.valid_password?(params[:current_password])

    flash[:invalid_password] = 'Password is invalid'
    redirect_to edit_user_registration_path
  end

  def update
    super
  end

  private

  def update_resource(resource, params)
    return super if params['password']&.present?

    resource.update_without_password(params.except('current_password'))
  end
end
