class MonsterForm
  include ActiveModel::Model

  DEFAULT_NAME = "のぐち"

  attr_accessor :file, :detector, :user_id, :serial_number, :noguchi

  validates :serial_number, presence: true
  validate :unique_serial_number

  def save
    return false if invalid?

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

  def serial_number
    return @serial_number if @serial_number

    detector = TextDetector.new(file: file)
    detector.detect
    @serial_number = detector.serial_number
  end

  def user
    @user ||= User.find user_id
  end

  def unique_serial_number
    errors.add(:serial_number, :taken) if Monster.exists?(serial_number: serial_number)
  end
end
