class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_field

  def home
    # --------------DASHBOARD BEGIN----do not touch-------------
    # All events for a club - dashboard
    if user_signed_in? && current_user.club != nil
    @upcoming_events = []
    @fields.each do |f|
      if f.events #Check if a field has events
        f.events.each do |e|
          @upcoming_events << e if e.start_date > DateTime.now
          @next_event = @upcoming_events.first
        end
      end
    end
    # total revenue for a club
    @total = 0
    @upcoming_events.each do |e|
      @field = Field.find(e.field_id)
      @total += ((e.end_date.to_i - e.start_date.to_i) / 3600) * @field.price.to_i
    end
    # end total revenue for club
    # revenue for this week
    @this_week_revenue = 0
    @last_week_revenue = 0
    @fields.each do |f|
      f.events.each do |e|
        if e.start_date > DateTime.now - 7
          @this_week_revenue += ((e.end_date.to_i - e.start_date.to_i) / 3600) * @field.price.to_i
        elsif e.start_date < DateTime.now - 7 && e.start_date > DateTime.now - 14
          @last_week_revenue += ((e.end_date.to_i - e.start_date.to_i) / 3600) * @field.price.to_i
        end
      end
    end
  end
  # end revenue for this week
  #------------------DASHBOARD END-------------------------
  end

  private
  # User checks to prevent crashes
  def set_field
    if user_signed_in?
      @player = current_user.player.nil? ? Player.new : current_user.player
      @player.user = current_user
      if current_user.club.nil?
      else
      #elsif !current_user.is_player && current_user.club.name
          @club = current_user.club
          @fields = @club.fields
        end
    end
  end
end
