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

    policy_scope(Player)
  end

  def new
      @clubs = Club.all
      @player = Player.new
      authorize @player
  end

  def show
    @player = Player.find(params[:id])
    authorize @player
  end


  def create
    @player = Player.new(player_params)
    authorize @player
    @player.user = current_user
    if @player.save!
      redirect_to user_players_path(current_user)
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
    authorize @player
  end

  def update
    @player = current_user.player
    authorize @player
    if @player.update(player_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def player_params
    params.require(:player).permit(:user_id, :first_name, :last_name, :phone_number, :birth_date, :description, :tennis, :padel, :squash, :tennis_level, :padel_level, :squash_level, :gender, :photo)
  end
end
