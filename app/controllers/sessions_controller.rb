class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      sign_in user
    end
    redirect_to root_url
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
