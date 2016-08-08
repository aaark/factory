class UsersController < ApplicationController
  before_filter :check_for_admin, only: [:new, :index, :edit, :destroy, :transfer]
  before_action :check_logged_in?

  def new
    #check_logged_in?
    @user = User.new
  end

  def create
    #check_logged_in?
    @user = User.new(user_params)
    if @user.save
      
      flash[:success] = "User has been created"
      render 'new'
    else
      flash[:errror] = "not saved"
      render 'new'
    end
  end

  def index
   @users = User.all
  end
  def show
    #check_logged_in?
    @user = User.find(params[:id])
    @user1 = User.all
  end
  def edit
    #check_logged_in?
    @user = User.find(params[:id])
  end
  def update
    #check_logged_in?
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      render text: "updated successfully"

    else
      render 'edit'
    end
  end

  def destroy
    #check_logged_in?
    @user = User.find(params[:id])
    if @user.admin ==  true
      flash[:error] = "Since you are an admin so you can not delete your self so first you need to transfer your adminstration then ask admin to delete yourself" 
    else
      @user.destroy  
      flash[:success] = "User deleted"
    end
    redirect_to :back  
  end
  def transfer1
    #check_logged_in?
    if current_user.admin == false
      flash[:failure] = "Sorry you are no longer admin now"
      redirect_to current_user
    else
      @user = User.find_by(id: params[:test][:id])
      puts "user to admin",@user
      current_user.update(admin: "false")
      @user.update(admin:"true")
      flash[:success] = "Adminstration transfered"
      redirect_to current_user
    end

  end
  def share_form
    @users = User.where("id!=?", current_user.id)
  end
  def attach_sharing
    @vech = Vehicle.find(params[:id])
    @user = User.find(params[:test][:id])
    @user.vehicles << @vech
    redirect_to current_user
  end
  def transfer
    @users = User.where("id!=?", current_user.id)
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
