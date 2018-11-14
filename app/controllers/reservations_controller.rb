class ReservationsController < ApplicationController
  def index
    @reservations = policy_scope(Reservation)
  end

  def show
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def new
    @user = current_user
    @field = Field.find(params[:field_id])
    @reservation = Reservation.new
    authorize @reservation
    @club = Club.find(params[:club_id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def create
    @field = Field.find(params[:field_id])
    @reservation = Reservation.new(reservation_params)
    authorize @reservation
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
    authorize @reservation
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
    params.require(:reservation).permit(:booking_day, :booking_hour_start, :booking_hour_end, :field_id, :user_id)
  end
end
