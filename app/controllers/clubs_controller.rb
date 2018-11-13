class ClubsController < ApplicationController
  def index
    @clubs = Club.all
    policy_scope(Player)
  end

  def new
    @club = Club.new
    authorize @club
  end

  def show
    @club = Club.find(params[:id])
    authorize @club
  end

  def edit

    @club = Club.find(params[:id])
    authorize @club
  end

  def create
    @club = Club.new(club_params)
    authorize @club
    @club.user = current_user
    if @club.save
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    @club = Club.find(params[:id])
    authorize @club
    @club.update(club_params)
    redirect_to club_path(@club)
  end

  def destroy
  @club = Club.find(params[:id])
  authorize @club
  @club.destroy
  redirect_to root_path
  end

  private

  def club_params
    params.require(:club).permit(:name, :address)
  end
end
