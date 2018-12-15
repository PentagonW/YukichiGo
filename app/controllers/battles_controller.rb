class BattlesController < ApplicationController
  def index
    @win_battles = current_user.win_battles
    @lose_battles = current_user.lose_battles
  end

  def new
  end
end
