# frozen_string_literal: true

module Admin
  class ApplicationController < ActionController::Base
    allow_browser versions: :modern
    stale_when_importmap_changes
    before_action :require_login

    helper_method :current_user
    helper_method :logged_in?

    private

    def current_user
      return unless session[:id].present?

      @current_user ||= User.find(session[:id])
    end

    def logged_in?
      current_user.present?
    end

    def require_login
      return if logged_in?

      redirect_to new_sessions_path
    end
  end
end
