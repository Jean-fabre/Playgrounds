class PlayersController < ApplicationController
  def index
    @players = Player.all

    if params[:first_name].present?
      @players = @players.where(first_name: params[:first_name])
    end

    if params[:last_name].present?
      @players = @players.where(last_name: params[:last_name])
    end

    if params[:tennis_level].present?
      @players = @players.where(tennis_level: params[:tennis_level])
    end

    if params[:squash_level].present?
      @players = @players.where(squash_level: params[:squash_level])
    end

    if params[:padel_level].present?
      @players = @players.where(padel_level: params[:padel_level])
    end
  end

  def new
    @player = Player.new
  end

  def show
    @player = current_user.player
    # if @player.nil?
    #   redirect_to new_user_player_path(current_user)
    # else
    #   @player = current_user.player
    # end
  end

  def edit
    @player = Player.find(params[:id])
    @player = current_user.player
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

  def update
    @player = Player.find(params[:id])
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
