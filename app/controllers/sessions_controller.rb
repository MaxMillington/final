class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to links_path
    else
      flash.keep[:danger] = 'Password or email invalid'
      render 'new'
    end
  end

  def destroy
    !current_user.nil?
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end
end