class MonstersController < ApplicationController
  def new
    @moster_form = MonsterForm.new
  end

  def create
    @moster_form = MonsterForm.new(form_params)
  end

  private

    def form_params
      params.permit(:file)
    end
end
