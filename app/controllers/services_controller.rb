class ServicesController < ApplicationController
  before_action :service_params, only: %i[create update]
  before_action :set_service, only: %i[show edit update destroy]
  before_action :set_user, only: %i[new create update]

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = @user
    @service.save
    redirect_to service_path(@service)
  end

  def show
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      render :edit
    end
  end

  def destroy
    if @service.destroy
      redirect_to services_path
    else
      render :show
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :price)
  end
end
