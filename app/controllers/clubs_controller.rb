class ClubsController < ApplicationController
  def index
    @clubs = Club.all

    if params[:name].present?
      @clubs = @clubs.where("name ILIKE ?", "%#{params[:name]}%")
    end

    if params[:adress].present?
      @clubs = @clubs.where("adress ILIKE ?", "%#{params[:adress]}%")
    end

    @clubs = Club.where.not(latitude: nil, longitude: nil)

    @markers = @clubs.map do |club|
      {
        lng: club.longitude,
        lat: club.latitude
      }
    end
  end

  def new
    @club = Club.new
  end

  def show
    @club = Club.find(params[:id])

     @clubs = Club.where.not(latitude: nil, longitude: nil)
     @markers = @clubs.map do |club|
      {
        lng: club.longitude,
        lat: club.latitude
      }
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def create
    @club = Club.new(club_params)
    @club.user = current_user
    if @club.save
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    @club = Club.find(params[:id])
    @club.update(club_params)
    redirect_to club_path(@club)
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
