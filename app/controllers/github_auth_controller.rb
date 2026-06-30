class GithubAuthController < ApplicationController
  def github_create
    auth_hash = request.env["omniauth.auth"]

    email = auth_hash["info"]["email"]
    if (user = User.find_by(email: email)) && email.end_with?("@rizapgroup.com")
      session[:id] = user.id
      redirect_to admin_users_path, status: :see_other
    else
      render new_sessions_path, status: :unauthorized
    end
  end
end
