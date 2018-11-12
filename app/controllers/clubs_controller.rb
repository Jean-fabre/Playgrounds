class ClubsController < ApplicationController
  def index
    @clubs = Club.all
  end

  def new
    @club = Club.new
  end

  def show
    @club = Club.find(params[:id])
  end

  def edit
    @club = Club.find(params[:id])
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      redirect_to root_path
    else
      render :show
    end
  end

  def destroy
  @club = Club.find(params[:id])
  @club.destroy
  redirect_to root_path
  end

  private

  def club_params
    params.require(:club).permit(:name, :address)
  end
end
