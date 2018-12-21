class Monster < ApplicationRecord
  has_one :ability, dependent: :destroy, inverse_of: :monster
  belongs_to :user, required: false
  enum ecology: { reading: 0, wild: 1 }

  delegate :class_type, to: :ability, allow_nil: true
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  before_save :ensure_city, if: -> { self.address.present? }

  def display_name
    name || "ノグチ"
  end

  def update_experience(calculator)
    self.experience_value = calculator.gained_experience
    self.level += calculator.gained_level
    self.power += calculator.gained_power
    save
  end

  def ensure_city
    array = self.address.split(", ")
    self.country = array.last
    self.city = "#{array[array.count - 4]}/#{array[array.count - 5]}"
  end
end
