class FieldsController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @fields = Field.all
    find_field
    policy_scope(Field)
  end

  def new
    @club = Club.find(params[:club_id])
    @field = Field.new
    authorize @field
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
    @field = Field.new(field_params)
    @field.club = @club
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

  def find_field
    if params[:field_type].present?
    @fields = @fields.where(field_type: params[:field_type])
    end

    if params[:club_address].present?
    @fields = Field.where(field_type: params[:field_type]).global_search(params[:club_address])
    end

    if params[:start_date]

    end

    if params[:end_date]

    end
  end

  private

  def field_params
    params.require(:field).permit(:user_id, :club_id, :field_type, :availability, :price)
  end
end
