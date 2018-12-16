class ExperienceCalculator
  include ActiveModel::Model

  attr_accessor :monster, :opponent, :judge

  def gain
    @gain ||= (base_point * distance * 0.5 / monster.level).round
  end

  def gained_power
    @gained_power ||= base_power * gained_level
  end

  def gained_experience
    experience_value = monster.experience_value + gain
    @gained_experience ||= experience_value % monster.experience_value_limit
  end

  def gained_level
    experience_value = monster.experience_value + gain
    @gained_level ||= experience_value / monster.experience_value_limit
  end

  def base_power
    200
  end

  def base_point
    0.8
  end

  def distance
    return 1 unless judge

    (monster.power - opponent.power).abs
  end
end
