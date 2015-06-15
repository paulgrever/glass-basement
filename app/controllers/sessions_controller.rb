class SessionsController < ApplicationController
  def create
    req = request.env["omniauth.auth"]
    @user = User.find_or_create_by_auth(req)
    redirect_to root_path
  end
end
