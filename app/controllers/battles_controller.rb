class BattlesController < ApplicationController
  def index
    @win_battles = current_user.monsters&.find(params[:monster_id])&.win_battles
    @lose_battles = current_user.monsters&.find(params[:monster_id])&.lose_battles
  end

  def new
  end
end
