class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def check_logged_in?
    if !logged_in?
      redirect_to root_path
    end
  end
end
