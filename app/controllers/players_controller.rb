class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = current_user.player
    # if @player.nil?
    #   redirect_to new_user_player_path(current_user)
    # else
    #   @player = current_user.player
    # end
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.user = current_user
    if @player.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @player = current_user.player
  end

  def update
    @player = current_user.profile
    if @player.update(player_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def player_params
    params.require(:player).permit(:user_id, :first_name, :last_name, :phone_number, :birth_date, :description, :tennis, :padel, :squash, :tennis_level, :padel_level, :squash_level, :gender)
  end
end
