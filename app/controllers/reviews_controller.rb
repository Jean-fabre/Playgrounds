 class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @club = Club.find(params[:club_id])
  end

  def show
    @player = Player.find(parmas[:player_id])
    @review = Review.find(params[:id])
  end

  def new
     @club = Club.find(params[:club_id])
     @user = current_user
     @review = Review.new
  end

  def create
    @user = current_user
    @club = Club.find(params[:club_id])
    @review = Review.new(reviews_params)
    @review.club = @club
    @review.user = @user
    if @review.save
      redirect_to clubs_path
    else
      render 'clubs/show'
    end
  end

  def destroy
    @review.destroy
  end

  private

  def reviews_params
    params.require(:review).permit(:rating, :comment, :club_id, :user_id, :player_id)
  end
end
