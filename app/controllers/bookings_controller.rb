class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new(booking_params)
    @service.user = current_user
    authorize @booking
    @booking.service = @service
    if booking.save
      redirect_to booking_path(@booking)
    end  
  end

  def show
    @booking = Booking.find()
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :service_id)
  end
end
