class ServicesController < ApplicationController
  #skip_before_action :authenticate_user!, only: :profile
  before_action :service_params, only: %i[create update destroy]
  before_action :set_service, only: %i[show edit update destroy]
  before_action :set_user, only: %i[new create update destroy]

  def index
    @services = policy_scope(Service)
  end

  def profile
    @my_services = current_user.services
    authorize @my_services
  end  

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    @service.user = @user
    authorize @service
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
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
    authorize @service
    if @service.destroy
      redirect_to service_path
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
    authorize @service
  end

  def service_params
    params.require(:service).permit(:name, :description, :price, :photo)
  end
end
