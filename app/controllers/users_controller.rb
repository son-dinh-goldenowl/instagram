class UsersController < ApplicationController
  before_action :load_user, only: :show
  def show
  end

  def load_user
    @user = User.find_by(id: params[:id])
    return if @user
    render 'devise/shared/not_found'
  end

  def validate_email_user
    flash[:error_email] = []
    flash[:error_email] << 'hahaa' if User.all.pluck(:email).include?(params[:email])
    # render 'devise/registrations/new'
  end
end
