class Api::V1::MainMonstersController < ApplicationController
  def create
    monster = current_user.monsters.find(params[:monster_id])
    current_user.main_monster = monster
    if current_user.save
      render json: { id: monster.id }
    else
      render status: 422, json: { errors: "not saving" }
    end
  end
end