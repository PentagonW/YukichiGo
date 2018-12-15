class MonstersController < ApplicationController
  def index
    users = User.all
    monsters = Monster.where(id: users.map(&:main_monster_id)).includes(:user, :ability)
    @world_monsters = monsters.order(created_at: :desc).page(params[:page])
    @strong_monsters = monsters.order(power: :desc).limit 10
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
