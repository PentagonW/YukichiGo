class PowerCalculator < ApplicationRecord
  attr_reader :serial_number

  def initialize(serial_number)
    @serial_number = serial_number
  end

  def power
    return monster.power if monster

    SecureRandom.random_number * rand(100000)
  end

  private

    def moster
      Monster.find_by(serial_number: serial_number)
    end
end
