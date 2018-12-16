class Monster < ApplicationRecord
  has_one :ability, dependent: :destroy, inverse_of: :monster
  belongs_to :user, required: false
  enum ecology: { reading: 0, wild: 1 }

  delegate :class_type, to: :ability, allow_nil: true

  def display_name
    name || "ノグチ"
  end

  def update_experience!(opponent, judge)
    calculator = ExperienceCalculator.new monster: self, opponent: opponent, judge: judge
    self.experience_value += calculator.gain
    self.level += experience_value / experience_value_limit
    self.experience_value %= experience_value_limit
    save!
  end
end
