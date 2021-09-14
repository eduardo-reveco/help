class ReviewsController < ApplicationController
  def new
    @service = Service.find(params[:service_id])
    @review = Review.new
    authorize @review
  end
end
