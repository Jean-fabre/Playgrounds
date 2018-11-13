class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @user = current_user
    @field = Field.find(params[:field_id])
    @reservation = Reservation.new
    @club = Club.find(params[:club_id])
    # @reservation.user = current_user
    # @reservation.field = @field
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    @field = Field.find(params[:field_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.field = @field
    if @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @reservation = Reservation.update(reservation_params)
    if @reservation.update(reservation_params)
      redirect_to profile_reservations_path(reservations), notice: 'Reservation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.update(reservation_params)
    @reservation.destroy
    redirect_to profile_path(profile), notice: 'Reservation was successfully destroyed.'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:booked_from, :booked_to, :field_id, :user_id)
  end
end
