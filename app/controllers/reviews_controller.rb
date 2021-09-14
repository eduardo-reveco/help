class ReviewsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @review = Review.new
    authorize @review
  end

  def create
    @service = Service.find(params[:service_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.service = @service
    authorize @review
    if @review.save
      redirect_to service_path(@service)
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

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
