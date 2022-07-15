class ProfileController < ApplicationController
  #  before_action :authenticate_user!
  skip_before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_parmas)
      redirect_to profile_path(params[:id])
    else
      flash[:danger] = 'Invalid input'
      render 'edit'
    end
  end

  def index
    @users = User.with_attached_avatar.includes({avatar_attachment: :blob},:followers,:following).order(created_at: :desc)
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
