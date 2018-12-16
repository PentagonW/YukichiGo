class Api::V1::MonstersController < ApplicationController
  def create
    power = PowerCalculator.new(randomize).power
    @monster = Monster.new(ecology: :wild, power: power, serial_number: randomize)
    @monster.build_ability(class_type: rand(3))
    @monster.save!
    AddAdjective.new(@monster).update_adjective
    render json: { id: @monster.id }
  end

  private

    def randomize
      @randomize ||= SecureRandom.hex(4).upcase + ("A".."Z").to_a.sample
    end
end