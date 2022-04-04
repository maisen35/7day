class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :ensure_correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @time_lines = Tweet.page(params[:page]).per(5).order(created_at: :desc)
    @mylines = Tweet.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc).page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :twitter, :instagram)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
