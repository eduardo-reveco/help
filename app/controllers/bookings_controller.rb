class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new
    @service.user = current_user
    authorize @booking
    @booking.service = @service
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to services_path  
    end  
  end

  def show
    @booking = Booking.find()
    authorize @booking
  end

  private

end
