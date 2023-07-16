class ApplicationController < ActionController::Base
    before_action :require_login
    before_action :set_search

    private
    
    def not_authenticated
        redirect_to login_path, danger: "ログインしてください"
    end

    def set_search
        @q = Post.ransack(params[:q])
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      end
    
    helper_method :current_user
end
