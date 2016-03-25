class SessionsController < ApplicationController
  def create
    # raise env["omniauth.auth"].to_yaml
    omniauth = env["omniauth.auth"]
    user = User.find_or_initialize_by(token: omniauth.uid) do |u|
      u.name = omniauth.info.name
      u.email = omniauth.info.email
      u.save
    end

    session[:user_token] = omniauth.uid
    redirect_to root_url, notice: "Hi, #{user.name}"
  end

  def destroy
    session.clear # session[:user_token] = nil
    redirect_to root_url, notice: 'Bye for now. Come back soon.'
  end
end
