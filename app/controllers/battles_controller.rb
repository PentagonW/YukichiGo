class BattlesController < ApplicationController
  def index
    @win_battles = current_user.win_battles.order(created_at: :desc)
    @lose_battles = current_user.lose_battles.order(created_at: :desc)
  end

  def new
    @opponent = User.find params[:user_id]
    @judge = BattleJudge.new users: [current_user, @opponent]
    redirect_to root_path unless @judge.save
  end
end
