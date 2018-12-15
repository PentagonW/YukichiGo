class BattleJudge
  include ActiveModel::Model

  attr_accessor :users, :winner, :loser

  validates :monsters, length: { is: 2 }
  validate :with_main_monster?

  TRILEMMA = { 0 => 2, 1 => 0, 2 => 1 }.freeze

  def battle
    return if invalid?

    trilemma
    scores = monsters.map {|monster| [monster_power(monster), monster.user] }.to_h

    self.winner = scores[scores.keys.max]
    self.loser = scores[scores.keys.min]
  end

  def save
    return if invalid?

    battle
    Battle.create winner: winner, loser: loser
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

    def monster_power(monster)
      monster.power + chance
    end

    def trilemma
      monsters.each do |monster|
        monster.create_ability unless monster.class_type
      end

      if TRILEMMA[monsters.first.class_type] == monsters.last.class_type
        monsters.first.power *= 1.2
        monsters.last.power *= 0.8
      end
      if TRILEMMA[monsters.last.class_type] == monsters.first.class_type
        monsters.first.power *= 0.8
        monsters.last.power *= 1.2
      end
    end
end
