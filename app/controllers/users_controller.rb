class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]



  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  else
    flash.now[:alert] = "Fields are incomplete"
    render :new
  end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_url unless @current_user == @user
  end

  def update
    @user = User.find(params[:id])
    redirect_to root_url unless @current_user == @user
    @user.update(user_params)
    redirect_to users_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def logged_in_user
    unless logged_in?
      flash[:alert] = "Please log in."
      render :new
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user === current_user?(@user)
  end
end
