class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new
    @booking.user = current_user
    @booking.service = @service
    authorize @booking
    if @booking.save
      redirect_to profile_path(@booking)
    else
      redirect_to services_path
      flash[:alert] = "No puedes reservar este servicio. Ya tienes una reserva"
    end 
  end

  def show
  end

  def destroy
    if @booking.destroy
      redirect_to profile_path
    else
      render :show
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:user_id, :service_id)
  end
end
