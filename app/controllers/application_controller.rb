class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  helper_method :current_user
  helper_method :logged_in?

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def current_user
    return unless session[:id].present?

    @current_user ||= User.find(session[:id])
  end

  def logged_in?
    current_user.present?
  end

  def record_not_found
    render template: "errors/not_found", status: :not_found
  end
end
