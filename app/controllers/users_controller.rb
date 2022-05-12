class UsersController < ApplicationController
  before_action :load_user, only: [:show, :update]

  def show
  end

  def upload_avatar
    return render_avatar(params[:file]) if params[:file].content_type.split('/').first == 'image'

    render_avatar(false)
  end

  def destroy_avatar
    render_avatar('')
  end

  def render_avatar(params)
    @user = current_user
    @user.update(avatar: params) if params != false
    render json: { html: render_to_string(partial: 'avatar') }
  end

  private

  def load_user
    @user = User.find_by(id: params[:id])
  end
end
