class Admin::ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes
  layout 'admin'
  before_action :require_login

   helper_method :current_user, :logged_in?

  private
    def current_user
      if session[:id].present?
        @current_user = @current_user || User.find(session[:id])
      end 
    end
  def logged_in?
    current_user.present? 
  end

  def require_login
    if not logged_in?
      redirect_to login_path
    end
  end
end
