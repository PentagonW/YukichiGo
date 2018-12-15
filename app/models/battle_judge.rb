class BattleJudge
  attr_reader :right_monster, :left_monster

  def initialize(right_monster, left_monster)
    @right_monster = right_monster
    @left_monster = left_monster
  end

  def winner
    return right_monster if right_monster.power > left_monster.power

    left_monster.power
  end

  def loser
    return left_monster unless winner == right_monster

    right_monster
  end
end
