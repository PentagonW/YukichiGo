class MapsController < ApplicationController
  before_action :required_main_monster

  def index
  end

  private

    def required_main_monster
      unless current_user.main_monster
        flash[:error] = "ユーザー情報のノグチ一覧から、メインノグチを登録してください"
        redirect_to user_path(current_user)
      end
    end
end