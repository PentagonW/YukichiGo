class MonsterForm
  include ActiveModel::Model

  attr_accessor :file, :detector, :user_id

  def save
    detector = TextDetector.new(file: file)
    detector.detect
    serial_number = detector.serial_number

    return false if Monster.find_by(serial_number: serial_number)

    power = PowerCalculator.new(serial_number).power
    noguchi = Monster.new(name: "のぐち", serial_number: serial_number, power: power, user_id: user_id)
    noguchi.save

    AddAdjective.new(noguchi).update_adjective
  end
end
