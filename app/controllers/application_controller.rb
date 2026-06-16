class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

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
end
