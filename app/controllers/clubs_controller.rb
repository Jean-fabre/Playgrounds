class ClubsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @clubs = Club.all
    # @user = current_user
    # @field = Field.find(params[:field_id])
    # @event = Event.new(params[:id])
    # @event.save
    # @club = Club.find(params[:club_id])
    @fields = Field.all
    find_field

    @markers = @clubs.map do |club|
      {
        lng: club.longitude,
        lat: club.latitude,
        infoWindow: { content: render_to_string(partial: "/clubs/map_box", locals: { club: club }) }
      }
    end
    policy_scope(Player)
  end

  def new
    @club = Club.new
    authorize @club
  end

  def show
    @club = Club.find(params[:id])
    @review = Review.new

    @markers =
    [{
      lng: @club.longitude,
      lat: @club.latitude
    }]
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
    params.require(:club).permit(:name, :address, :city, :photo, :club_id)
  end

  def find_field
    if params[:field_type].present? && !params[:field_type].blank?
      @fields1 = @fields.where(field_type: params[:field_type])
      @fields = @fields1.map{|f| f}
    end
     p params[:name].present?
     p params[:name].blank?
    if params[:name].present? && !params[:name].blank?
      @clubs1 = @clubs.where("name ILIKE ?", "%#{params[:name]}%")
      @clubs1_fields = @clubs1.map {|c| c.fields }
      p "clubs field 1"
      p @clubs1_fields.flatten
      p "fields found bt rype"
      p @fields
      p "juncion "
      p @fields && @clubs1_fields
      @fields.nil? ? @fields = @clubs1_fields : @fields = @fields && @clubs1_fields
      p @clubs1_fields
      p @fields
    end

    if params[:city].present? && !params[:city].blank?
      @clubs2 = @clubs.where("city ILIKE ?", "%#{params[:city]}%")
      @clubs2_fields = @clubs2.map {|c| c.fields }
      @fields.nil? ? @fields = @clubs2_fields : @fields = @fields && @clubs2_fields

    end
    @fields = @fields.flatten unless @fields

    p @clubs1
    p @clubs2
  end
end

