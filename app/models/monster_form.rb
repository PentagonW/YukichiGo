class MonsterForm
  include ActiveModel::Model

  DEFAULT_NAME = "のぐち"

  attr_accessor :file, :detector, :user_id, :serial_number, :noguchi

  def save
    get_serial_number
    return false if Monster.find_by(serial_number: serial_number)

    power = PowerCalculator.new(serial_number).power

    noguchi = Monster.new(name: DEFAULT_NAME, serial_number: serial_number, power: power, user_id: user_id)
    @noguchi = noguchi.save

    AddAdjective.new(noguchi).update_adjective
  end

  def get_serial_number
    detector = TextDetector.new(file: file)
    detector.detect
    @serial_number = detector.serial_number
  end
end
