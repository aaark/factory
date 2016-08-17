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
      flash[:success]="updated successfully"
      redirect_to current_user
    else
      flash[:errors]= "Not updated there are some problem"
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
    check_logged_in?
    @users = User.where("id!=?", current_user.id)
  end
  def attach_sharing
    @vech = Vehicle.find(params[:id])
    @user = User.find(params[:test][:id])
    if @user.vehicles.find_by(id: params[:id]) 
      flash[:errors]=" user is already having this vehicle"
      redirect_to current_user
    else   
      flash[:success]=" successfully shared"
      @user.vehicles << @vech
      redirect_to current_user
    end  
  end
  def transfer
    @users = User.where("id!=?", current_user.id)
  end

  def change_pass
  end 
  def change_password
  
    if  current_user.authenticate(params[:user][:password])
      if current_user.update(password: params[:user][:new_password], password_confirmation: params[:user][:password_confirmation])
        flash[:success]="successfully updated Password"
        redirect_to current_user
      else
        flash[:error]= "Not updated some error occurs"
        redirect_to users_change_pass_path 
      end           
    else
      flash[:error]="Your credintials doesn't match"
      redirect_to users_change_pass_path
    end
  end  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end












