class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  private
  def require_login
    redirect_to '/sessions/new' unless current_user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

   def get_like_str (secret)
    likeStr = 'Like'
    if secret.likes.where(user_id: current_user.id).exists?
      likeStr = 'Unlike'
    end
    return likeStr
  end
  helper_method :get_like_str
end
