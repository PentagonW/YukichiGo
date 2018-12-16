class Battle < ApplicationRecord
  belongs_to :winner, class_name: "::User", foreign_key: "winner_id"
  belongs_to :loser, class_name: "::User", foreign_key: "loser_id"

  before_create :update_experience!

  def update_experience!
    winner.main_monster.update_experience! loser.main_monster, judge: true
    loser.main_monster.update_experience! winner.main_monster, judge: false
  end
end
