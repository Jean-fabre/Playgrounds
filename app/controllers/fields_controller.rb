class FieldsController < ApplicationController
  def index
    @fields = Field.all
  end

  def new
    @field = Field.new
  end

  def show
    @field = Field.find(params[:id])
  end

  def edit
    @field = Field.find(params[:id])
  end

  def create
    @field = Field.new(field_params)
    if @field.save
      redirect_to root_path
    else
      render :show
    end
  end

  def destroy
  @field = Field.find(params[:id])
  @field.destroy
  redirect_to root_path
  end

  private

  def field_params
    params.require(:field).permit(:field_type, :availability, :price)
  end
end
