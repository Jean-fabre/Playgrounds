class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    #authorize @event
  end

  def new
    @user = current_user
    @field = Field.find(params[:field_id])
    @event = Event.new
    #authorize @event
    @club = Club.find(params[:club_id])
  end

  def edit
    @event = Event.find(params[:id])
    #authorize @event
  end

  def events_to_calendar
    @club = current_user.club
    @fields = @club.fields
    array_return = []
    @fields.each do |field|
      @events = field.events
      @events.each do |ev|
        array_return << { "title" => "field #{ev.field.id}", "start" => ev.start_date.to_datetime.to_s, "end" => ev.end_date.to_datetime.to_s}
      end
    end
    render json: array_return.to_json
    array_return = []
  end

  def create
    @user = current_user
    @field = Field.find(params[:field_id])
    @event = Event.new(event_params)
    #authorize @event
    @event.user = current_user
    @event.field = @field
    a = current_user.player.first_name, current_user.player.last_name
    a = a.join(" ")
    @event.title = a
    if @event.save
      redirect_to clubs_path
    else
      render :new
    end
  end


  def update
    @event = Event.update(event_params)
    #authorize @event
    if @event.update(event_params)
      redirect_to profile_events_path(events), notice: 'Reservation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.update(event_params)
    @event.destroy
    redirect_to profile_path(profile), notice: 'Reservation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date, :user_id, :field_id, :club_id)
    end
end
