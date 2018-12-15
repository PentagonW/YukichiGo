class BattleJudge
  include ActiveModel::Model

  attr_accessor :users, :winner, :loser

  validates :monsters, length: { is: 2 }
  validate :with_main_monster?

  def battle
    return if invalid?

    trilemma(monsters.first, monsters.last)
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

    def trilemma(monster1, monster2)
      monster1.build_ability.save unless monster1.class_type
      monster2.build_ability.save unless monster2.class_type

      if (monster1.class_type == 0 && monster2.class_type == 1) || (monster1.class_type == 1 && monster2.class_type == 2) || (monster1.class_type == 2 && monster2.class_type == 0)
        monster1.power *= 0.9
        monster2.power *= 1.1
      elsif (monster1.class_type == 1 && monster2.class_type == 0) || (monster1.class_type == 2 && monster2.class_type == 1) || (monster1.class_type == 0 && monster2.class_type == 2)
        monster1.power *= 1.1
        monster2.power *= 0.9
      end
      [monster1, monster2]
    end
end
