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
      redirect_to complete_path @monster_form.noguchi.id
    else
      render :new
    end
  end

  def complete
    @monster = Monster.find
  end

  def failure
  end

  private

    def form_params
      params.permit(:file)
    end
end
