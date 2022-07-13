class ProfileController < ApplicationController
  #  before_action :authenticate_user!
  skip_before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    # if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
    #     params[:user].delete(:password)
    #     params[:user].delete(:password_confirmation)
    # end

    if @user.update(user_parmas)
      redirect_to profile_path(params[:id])
    else
      flash[:danger] = 'Invalid input'
      # redirect_to edit_user_registration_path(id: current_user.id)

    end
  end

  def index
    @users = User.with_attached_avatar.includes(:followers,:following).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def user_parmas
    params.require(:user).permit(:name, :firstname, :email, :avatar)
  end
end
