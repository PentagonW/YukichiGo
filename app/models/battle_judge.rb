class BattleJudge
  include ActiveModel::Model

  attr_accessor :users, :winner, :loser

  validates :monsters, length: { is: 2 }
  validate :with_main_monster?

  def battle
    return if invalid?

    scores = monsters.map {|monster| [monster.power + chance, monster.user] }.to_h
    self.winner = scores[scores.keys.max]
    self.loser = scores[scores.keys.min]
  end

  def save
    return if invalid?

    battle
    Battle.new winner: winner, loser: loser
  end

  def monsters
    @monsters ||= users.map &:main_monster
  end

  def chance
    Random.rand * (powers.first - powers.last).abs * 0.1
  end

  private

    def with_main_monster?
      errors.add(:users, :invalid) unless monsters.all?
    end

    def powers
      monsters.map &:power
    end
end
