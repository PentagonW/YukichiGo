class User < ApplicationRecord
  has_many :monsters
  belongs_to :main_monster, class_name: "Monster", required: false
  has_many :win_battles, class_name: "::Battle", foreign_key: "winner_id", dependent: :destroy
  has_many :lose_battles, class_name: "::Battle", foreign_key: "loser_id", dependent: :destroy
  has_many :money_histories, class_name: "::MoneyHistory", dependent: :destroy

  # 所持金
  def money_in_hand
    money + money_histories.pluck(:price).sum
  end
end
