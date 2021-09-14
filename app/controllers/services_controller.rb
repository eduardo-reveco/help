class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]
  before_action :set_user, only: %i[new create update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
   if params[:query].present? 
    @services = policy_scope(Service).where("name ILIKE ?", "%#{params[:query]}%")
   else
    @services = policy_scope(Service)
    end
  end

  def profile
    @my_services = current_user.services
    @my_bookings = current_user.bookings
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
      redirect_to profile_path(@service)
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
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    authorize @service
    if @service.destroy
      redirect_to profile_path
    else
      render :show
    end
  end

 

  private

  def set_user
    @user = current_user
  end

<<<<<<< HEAD

=======
>>>>>>> 6fc6e36341d12565fdebb1831debebff1dd5ff80
  def set_service
    @service = Service.find(params[:id])
    authorize @service
  end

  def service_params
    params.require(:service).permit(:name, :description, :price, :photo)
  end
end
