class UsersController < ApplicationController
  before_action :require_login, except: [:index, :show, :new, :create]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      auto_login(@user)
      redirect_to root_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    current_user.destroy
    redirect_to login_path # or root_path depending on your application
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :live_prefecture, :tolerance, :profile_img)
  end
end
