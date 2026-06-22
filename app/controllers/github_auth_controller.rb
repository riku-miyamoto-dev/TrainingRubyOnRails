class GithubAuthController < ApplicationController
  def github_create
    auth_hash = request.env['omniauth.auth']
    
    email = auth_hash.dig('info', 'email')
    binding.break
    if email.present? && email.end_with?("@rizapgroup.com")
      user = User.find_by(email: email)
      
      if user
        session[:id] = user.id
        redirect_to admin_users_path
      else
        redirect_to new_sessions_path
      end
    else
      render new_sessions_path
    end
  end
end
