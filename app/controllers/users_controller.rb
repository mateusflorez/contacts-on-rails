class UsersController < ApplicationController

  before_action :require_logged_in_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:success] = 'Data updated'
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User successfuly created'
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
