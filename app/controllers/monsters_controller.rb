class MonstersController < ApplicationController
  def index
    users = User.all
    @monsters = Monster.where(id: users.map(&:main_monster_id)).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @moster_form = MonsterForm.new
  end

  def create
    @moster_form = MonsterForm.new(form_params.merge(user_id: current_user.id))
    if @moster_form.save
      redirect_to complete_monsters_path(monster_id: @moster_form.noguchi.id)
    else
      render :failure
    end
  end

  def destroy
    @monster = Monster.find(params[:id])
    money_history = current_user.money_histories.build(price: MoneyHistory.BYE_MONSTER)
    if current_user.money_in_hand > MoneyHistory.BYE_MONSTER && money_history.save
      @monster.destroy!
      flash[:success] = "ノグチとバイバイしました"
      redirect_to user_path current_user
    else
      flash[:error] = "ノグチとバイバイに失敗しました"
      redirect_to user_path current_user
    end
  end

  def complete
    @monster = Monster.find params[:monster_id]
  end

  def failure
  end

  private

    def form_params
      params.permit(:file)
    end
end
