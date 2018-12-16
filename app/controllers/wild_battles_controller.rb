class WildBattlesController < ApplicationController
  def new
    @wild_monster = Monster.find params[:monster_id]
    @judge = WildBattleJudge.new user: current_user, wild_monster: @wild_monster
    # 勝った場合はゲット
    if @judge.winner?
      @wild_monster.user = current_user
      @wild_monster.save
    end
  end
end
