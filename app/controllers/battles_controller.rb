class BattlesController < ApplicationController
  def index
    @eee = nil
    binding.pry
    @win_battles = current_user.monsters&.where(monster_id: params[:monster_id])&.win_battles
    @lose_battles = current_user.monsters&.where(monster_id: params[:monster_id])&.lose_battles
  end

  def new
  end
end
