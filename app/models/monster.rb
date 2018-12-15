class Monster < ApplicationRecord
  has_one :ability, dependent: :destroy, inverse_of: :monster

  def display_name
    name || "ノグチ"
  end
end
