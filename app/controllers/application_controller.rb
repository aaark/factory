class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  before_filter :set_cache_headers
  before_action :set_cache_headers


 # before_filter :check_logged_in?, except: [:home, :new]


  def check_logged_in?
    if !logged_in?
      redirect_to root_path
    end
  end

  def check_for_admin
    if current_user == nil
      redirect_to root_path
    else
  	   if !current_user.admin == true
  		  flash[:error]="You are no t a admin"
  		  redirect_to current_user  
       end
    end      	
  end
  
  def set_cache_headers
    response.headers["Cache-Control"] = "no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = Time.now
  end
end
