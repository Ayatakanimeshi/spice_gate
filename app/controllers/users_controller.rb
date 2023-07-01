class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
  
    def index
      @users = User.all
    end
    
    def show
      @user = current_user
      
      if @user.nil?
        redirect_to users_path
      end
    end
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      
      if @user.save
        redirect_to login_path
      else
        render :new
        flash.now[:danger] = "登録に失敗しました"
      end
    end
    
    def edit
      @user = current_user
      
      if @user.nil?
        redirect_to users_path
      end
    end
    
    def update
      @user = current_user
      
      if @user.update(user_params)
        redirect_to users_path
      else
        render :edit
      end
    end
    
    def destroy
      current_user.destroy
      redirect_to users_path
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :live_prefecture, :tolerance, :profile_img)
    end
  end
  