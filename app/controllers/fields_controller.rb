class FieldsController < ApplicationController

  def index
    @fields = policy_scope(Field)
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
    params.require(:field).permit(:user_id, :club_id, :field_type, :availability, :price)
  end
end
