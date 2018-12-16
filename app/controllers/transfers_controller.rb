class TransfersController < ApplicationController
  def new
    @user = current_user
  end

  def create
    user = User.find_by(browser_id: browser_id)
    if user
      set_browser_id(transfer_params[:browser_id])
      flash[:success] = "ユキチを引き継ぎました"
      redirect_to user_path current_user
    else
      flash[:error] = "ユキチが見つかりませんでした"
      render :new
    end
  end

  private

    def transfer_params
      params.permit(:browser_id)
    end
end