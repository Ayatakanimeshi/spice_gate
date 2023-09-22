class UsersController < ApplicationController
  before_action :require_login, except: [:index, :show, :new, :create, :update_location]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      auto_login(@user)
      redirect_to root_path
    else
      flash.now[:danger] = "登録に失敗しました"
      redirect_to action: :new
    end
  end
  
  def update
    @user = current_user
    
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def update_location
    if current_user.update(latitude: params[:latitude], longitude: params[:longitude])
      head :ok
    else
      render json: { error: "位置情報の更新に失敗しました" }, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :live_prefecture, :tolerance, :profile_img)
  end
end
