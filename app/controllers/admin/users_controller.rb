class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)
  def index
    @users = User.all.includes(:tasks)
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user= User.new(user_params)
    if @user.save
      redirect_to admin_users_path
      flash[:notice] = "ユーザーを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
      flash[:notice] = "ユーザーを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
    flash[:notice] = "ユーザーを削除しました"
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
