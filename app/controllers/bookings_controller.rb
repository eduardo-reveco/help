class BookingsController < ApplicationController

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
      redirect_to booking_path(@booking)
    end  
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :service_id)
  end
end
