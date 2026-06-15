class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  helper_method :current_user

  private
    def current_user
      if cookies[:id].present?
        @current_user = @current_user || User.find(cookies[:id])
      end 
    end
end
