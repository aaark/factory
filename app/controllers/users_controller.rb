class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render text: "not saved"
    end
  end

  def show
    @user = User.find(params[:id])
    @user1 = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      render text: "updated successfully"

    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :user_type_id)
  end
end
