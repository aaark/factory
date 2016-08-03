class UsersController < ApplicationController
  def new
    check_logged_in?
    @user = User.new
  end

  def create
    check_logged_in?
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render text: "not saved"
    end
  end

  def index

  end
  def show
    check_logged_in?
    @user = User.find(params[:id])
    @user1 = User.all
  end
  def edit
    check_logged_in?
    @user = User.find(params[:id])
  end
  def update
    check_logged_in?
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      render text: "updated successfully"

    else
      render 'edit'
    end
  end

  def destroy
    check_logged_in?
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to :back
  end
  def transfer1
    check_logged_in?
    if current_user.admin == false
      flash[:failure] = "Sorry you are no longer admin now"
      redirect_to current_user
    else
      @user = User.find_by(id: params[:test][:id])
      current_user.update(admin: "false")
      @user.update(admin:"true")
      flash[:success] = "Adminstration transfered"
      redirect_to current_user
    end

  end
  def share_form
    @users = User.all
  end
  def attach_sharing
    @vech = Vehicle.find(params[:id])
    @user = User.find(params[:test][:id])
    @user.vehicles << @vech
    redirect_to current_user
  end
  def transfer
    @users = User.all
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :user_type_id)
  end
end
