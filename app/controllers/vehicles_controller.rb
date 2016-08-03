class VehiclesController < ApplicationController
  def new
    check_logged_in?
    @vehicle = Vehicle.new
  end

  def create
    check_logged_in?
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      flash[:success] = "Record saved"
      redirect_to current_user
    else
      flash[:failure] = "Record not saved Ensure valid data"
      redirect_to @vehicle


    end
  end
  def index
    check_logged_in?
    @vehicle = Vehicle.all
  end
  def show
  end
  def add_vehicle
    #@vehicle= Vehicle.find(params[:id])
  end
  def add
    @current_user = current_user

    if  @current_user.vehicles.find_by(id: params[:id])
      flash[:success] = "Sorry Cant be added it seems like it is already present"
      redirect_to @current_user
    else
      @veh= Vehicle.find(params[:id])
      @current_user.vehicles << @veh
      redirect_to @current_user
    end
  end
  def delete_vehicle
    @current_user = current_user
    @veh= Vehicle.find(params[:id])
    if @veh.del_date > Date.today
      flash[:success] = "Sorry Cant be deleted Please check your delivery date"
      redirect_to @current_user
    else
      @current_user.vehicles.delete(@veh)
      redirect_to @current_user
    end

  end
  def edit
    check_logged_in?
    @vehicle = Vehicle.find(params[:id])
  end
  def update
    check_logged_in?
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
  private
  def vehicle_params
    params.require(:vehicle).permit(:color, :type_name, :st_date, :del_date, :fuel, :power_rating,:type_name, :wt_oc)
  end

end
