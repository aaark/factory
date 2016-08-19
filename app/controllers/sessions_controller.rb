class SessionsController < ApplicationController
  def new
    if logged_in?
      @current_user= current_user
      redirect_to @current_user
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Inavalid email or password!!!'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
