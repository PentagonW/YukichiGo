class Monster < ApplicationRecord
  has_one :ability, dependent: :destroy, inverse_of: :monster
  belongs_to :user
  has_many :win_battles, class_name: "::Battle", foreign_key: "winner_id"
  has_many :lose_battles, class_name: "::Battle", foreign_key: "loser_id"

  def display_name
    name || "ノグチ"
  end
end
