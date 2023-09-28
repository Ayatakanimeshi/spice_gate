class ApplicationController < ActionController::Base
    before_action :require_login
    before_action :set_search
    before_action :set_meta_tags

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

    def set_meta_tags
        set_meta_tags default_meta_tags
    end
    
    helper_method :current_user
end
