# frozen_string_literal: true

class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

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
end
