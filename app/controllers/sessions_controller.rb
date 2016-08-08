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
      redirect_to user
    else
      flash[:error] = "Inavalid email or password!!!"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
