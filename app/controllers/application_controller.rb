class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def check_logged_in?
    if !logged_in?
      redirect_to root_path
    end
  end
  def check_for_admin
  	if !current_user.admin == true
  		flash[:error]="You are no t a admin"
  		redirect_to current_user

    end	
  end
end
