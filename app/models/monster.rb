class Monster < ApplicationRecord
  has_one :ability, dependent: :destroy, inverse_of: :monster
  belongs_to :user, required: false
  enum ecology: { reading: 0, wild: 1 }

  delegate :class_type, to: :ability, allow_nil: true

  def display_name
    name || "ノグチ"
  end

  def update_experience(calculator)
    self.experience_value = calculator.gained_experience
    self.level += calculator.gained_level
    self.power += calculator.gained_power
    save
  end
end
