class FieldsController < ApplicationController

  def index
    @fields = Field.all
     if params[:field_type].present?
      @fields = @fields.where(field_type: params[:field_type])
    end

    if params[:price].present?
      @fields = @fields.where(price: params[:price])
    end
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

    @club = Club.find(params[:club_id])
    @field = @club.fields.build(field_params)
    if @field.save
      redirect_to root_path
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
