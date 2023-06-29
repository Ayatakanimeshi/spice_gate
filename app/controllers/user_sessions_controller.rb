class UserSessionsController < ApplicationController
    def new
    end
  
    def create
      if login(params[:email], params[:password])
        redirect_to users_path
      else
        render :new
      end
    end
  
    def destroy
      logout
      redirect_to users_path
    end
  end
  