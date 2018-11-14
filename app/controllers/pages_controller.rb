class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @player = Player.new
    @player.user = current_user
  end
end
