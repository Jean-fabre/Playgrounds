class FieldsController < ApplicationController
  def index
    @fields = Field.all
  end

  def new
    @field = Field.new
    @club = Club.find(params[:club_id])
  end

  def show
    @field = Field.find(params[:id])
  end

  def edit
    @field = Field.find(params[:id])
  end

  def create
    @field = Field.new(field_params)
    @club = Club.find(params[:club_id])
    if @field.save!
      redirect_to club_fields_path
    else
      render :show
    end
  end

  def update
    @field = Field.find(params[:id])
    @field.update(field_params)
    redirect_to field_path(@field)
  end

  def destroy
    @field = Field.find(params[:id])
    @field.destroy
    redirect_to root_path
  end

  private

  def field_params
    params.require(:field).permit(:user_id, :club_id, :field_type, :availability, :price)
  end
end
