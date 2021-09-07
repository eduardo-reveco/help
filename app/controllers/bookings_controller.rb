class BookingsController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]
  before_action :set_user, only: %i[new create update]
  before_action :set_booking, only: %i[show index]

  def index
    @services = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:service_id, :user_id)
  end

  def set_user
    @user = current_user
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_service
    @service = Service.find(params[:id])
    authorize @service
  end
end
