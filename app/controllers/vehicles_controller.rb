class VehiclesController < ApplicationController
  before_action :check_logged_in?

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      flash[:success] = "Record saved"
      redirect_to current_user
    else
      flash[:failure] = "Record not saved Ensure valid data"
      render :new
    end
  end
  def index
    @vehicle = Vehicle.all
    @users = User.all
  end
  def show
  end
  def add_vehicle
    #@vehicle= Vehicle.find(params[:id])
  end
  def add
    @current_user = current_user

    if  @current_user.vehicles.find_by(id: params[:id])
      flash[:errors] = "Sorry Cant be added it seems like it is already present"
      redirect_to add_vehicle_to_list_vehicle_path

    else
      @veh= Vehicle.find(params[:id])
      @current_user.vehicles << @veh
      flash[:success] = "Successfully added"

      redirect_to add_vehicle_to_list_vehicle_path
    end
  end
  def delete_vehicle
    @current_user = current_user
    @veh= Vehicle.find(params[:id])
   if @veh.del_date > Date.today
      flash[:errors] = "Sorry Cant be deleted Please check your delivery date"
    else
      @current_user.vehicles.delete(@veh)
      flash[:success] = "Removed from your list"
      redirect_to :back
    
    end

  end
  def destroy
    Vehicle.find(params[:id]).destroy
    flash[:success] = "Vehicle deleted"
    redirect_to :back
  end
  def edit
    @vehicle = Vehicle.find(params[:id])
  end
  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(vehicle_params)
      # Handle a successful update.
      flash[:success] = "Successfully Updated"
      redirect_to current_user
    else
      flash[:failure] = "Not updated somthing goes wrong"
      redirect_to @vehicle
    end
  end

  def add_vehicle_to_list
    @vehicles = Vehicle.all
    #@users = User.all
  end  
  private
  def vehicle_params
    params.require(:vehicle).permit(:color, :type_name, :st_date, :del_date, :fuel, :power_rating,:type_name, :wt_oc)
  end

end
