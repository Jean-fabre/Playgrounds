class FieldsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @fields = 
    @fields = Field.all
     if params[:field_type].present?
      @fields = @fields.where(field_type: params[:field_type])
    end

    if params[:price].present?
      @fields = @fields.where(price: params[:price])
    end

    if params[:availability]
    end
      
    policy_scope(Field)
  end

  def new
    @field = Field.new
    authorize @field
    @club = Club.find(params[:club_id])

  end

  def show
    @field = Field.find(params[:id])
    @club = Club.find(params[:club_id])
    authorize @field
  end

  def edit
    @field = Field.find(params[:id])
    @club = Club.find(params[:club_id])
    authorize @field
  end

  def create
    @club = Club.find(params[:club_id])
    @field = @club.fields.build(field_params)
    authorize @field

    if @field.save
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    @club = Club.find(params[:club_id])
    @field = Field.find(params[:id])
    authorize @field
    @field.update(field_params)
    redirect_to club_path(@club)
  end

  def destroy

  @field = Field.find(params[:id])
  authorize @field
  @field.destroy
  redirect_to root_path
  end

  private

  def field_params
    params.require(:field).permit(:user_id, :club_id, :field_type, :availability, :price, :photo)
  end
end
