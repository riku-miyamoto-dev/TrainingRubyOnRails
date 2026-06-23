class Admin::ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes
  before_action :require_login

  helper_method :current_user
  helper_method :logged_in?
  before_action :set_breadcrumbs

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
      redirect_to new_sessions_path
    end
  end

  def add_breadcrumb(label, path = nil)
        @breadcrumbs << {
            label: label,
            path: path
        }
    end

    def set_breadcrumbs
        @breadcrumbs = []
    end
end
