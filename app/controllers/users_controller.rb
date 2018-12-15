class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @monsters = @user.monsters
  end
end