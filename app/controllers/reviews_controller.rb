class ReviewsController < ApplicationController
  def create
    @reservation = Reservation.find(params[:id])
    @review = Review.new(review_params)
    @review.reservation = @reservation
    @review.user = current_user
    if @review.save
      redirect_to cafe_path(@reservation.cafe), notice: 'Thank you for sharing your experience!'
    else
      render cafe_path(@reservation.cafe)
    end

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
