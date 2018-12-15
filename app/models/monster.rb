class Monster < ApplicationRecord
  has_one :ability, dependent: :destroy, inverse_of: :monster
  belongs_to :user

  def display_name
    name || "ノグチ"
  end
end
