class WildBattleJudge
  include ActiveModel::Model

  attr_accessor :user, :wild_monster, :winner, :loser

  validates :monsters, length: { is: 2 }
  validate :with_main_monster?

  TRILEMMA = { 0 => 2, 1 => 0, 2 => 1 }.freeze

  def winner?
    return if invalid?

    trilemma
    barance =  (powers.first + 0.1 ) / (powers.sum + 0.2)
    destiny = rand

    destiny < barance
  end

  def win?
    @win ||= winner?
  end

  def monsters
    @monsters ||= [user.main_monster, wild_monster]
  end

  def chance
    Random.rand * (powers.first - powers.last).abs * 0.1
  end

  private

    def with_main_monster?
      errors.add(:user, :invalid) unless monsters.all?
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
        monsters.first.power *= 1.4
      end
      if TRILEMMA[monsters.last.class_type] == monsters.first.class_type
        monsters.last.power *= 1.4
      end
    end
end
