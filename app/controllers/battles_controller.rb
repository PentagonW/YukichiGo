class BattlesController < ApplicationController
  def index
    @battles = current_user.battles
  end

  def new
  end
end
