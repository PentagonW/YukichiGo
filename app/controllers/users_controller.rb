class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @monsters = @user.monsters.order(created_at: :desc).page(params[:page])
  end
end