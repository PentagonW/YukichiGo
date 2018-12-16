class Monster < ApplicationRecord
  has_one :ability, dependent: :destroy, inverse_of: :monster
  belongs_to :user, require: false
  enum ecology: { reading: 0, wild: 1 }

  delegate :class_type, to: :ability, allow_nil: true

  def display_name
    name || "ノグチ"
  end
end
