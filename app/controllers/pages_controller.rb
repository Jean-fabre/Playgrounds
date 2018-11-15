class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    if user_signed_in?
      @player = current_user.player.nil? ? Player.new : current_user.player
      @player.user = current_user
    end
  end
end
