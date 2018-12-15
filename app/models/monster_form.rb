class MonsterForm
  include ActiveModel::Model

  DEFAULT_NAME = "のぐち"

  attr_accessor :file, :detector, :user_id, :serial_number, :noguchi

  def save
    get_serial_number

    if Monster.find_by(serial_number: serial_number)
      flash[:error] = "既にいるのぐちです。"
      return false
    end

    power = PowerCalculator.new(serial_number).power

    @noguchi = Monster.new(name: DEFAULT_NAME, serial_number: serial_number, power: power, user_id: user_id)
    @noguchi.save
    user.update! main_monster: @noguchi

    AddAdjective.new(noguchi).update_adjective
    true
  rescue ActiveRecord::RecordInvalid、ActiveRecord::RecordNotSaved
    false
  end

  def get_serial_number
    detector = TextDetector.new(file: file)
    detector.detect
    @serial_number = detector.serial_number
  end

  def user
    @user ||= User.find user_id
  end
end
