class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @club = Club.find(params[:club_id])
  end

  def show
  end

  def new
    @user = current_user
    @review = Review.new
    @club = Club.find(params[:club_id])
  end

  def create
    @user = current_user
    @review = Review.new(reviews_params)
    @club = Club.find(params[:club_id])
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @review.destroy
  end

  private

  def reviews_params
    params.require(:review).permit(:rating, :comment)
  end
end
