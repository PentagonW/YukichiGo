class ExperienceCalculator
  include ActiveModel::Model

  attr_accessor :monster, :opponent, :judge

  def gain
    (base_point * distance * 0.5 / monster.level).round
  end

  def base_point
    0.8
  end

  def distance
    return 1 unless judge

    (monster.power - opponent.power).abs
  end
end
