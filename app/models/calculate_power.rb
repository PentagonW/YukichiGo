class CalculatePower
  RANGE = 10_000_000
  def initialize(serial_number)
    @serial_number = serial_number
  end

  def power
    Random.new(serial_number).rand(RANGE)
  end

  private

    def serial_number
      @serial_number.slice!(2..7).to_i
    end
end
