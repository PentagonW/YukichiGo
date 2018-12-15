class MonsterForm
  include ActiveModel::Model

  DEFAULT_NAME = "のぐち"

  attr_accessor :file, :detector, :user_id, :serial_number, :noguchi

  validates :serial_number, presence: true
  validate :unique_serial_number
  validate :include_money_image

  delegate :serial_number, :labels, to: :detector, allow_nil: true

  def save
    return false if invalid?

    noguchi.build_ability(class_type: rand(3))
    noguchi.save!
    user.update! main_monster: noguchi unless user.main_monster
    AddAdjective.new(noguchi).update_adjective
    true
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved
    false
  end

  def noguchi
    @noguchi ||= Monster.new(name: DEFAULT_NAME, serial_number: serial_number, power: power, user_id: user_id)
  end

  def power
    PowerCalculator.new(serial_number).power
  end

  def user
    @user ||= User.find user_id
  end

  def detector
    return @detector if @detector

    @detector = TextDetector.new(file: file)
    @detector.detect
    return @detector
  end

  def unique_serial_number
    errors.add(:noguchi, :taken) if Monster.exists?(serial_number: serial_number)
  end

  def include_money_image
    errors.add(:base, :not_money) unless labels & %w(money currency cash)
  end
end
