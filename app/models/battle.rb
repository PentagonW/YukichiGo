class Battle < ApplicationRecord
  belongs_to :user
  belongs_to :winner, class_name: "::Monster", foreign_key: "winner_id"
  belongs_to :lower, class_name: "::Monster", foreign_key: "loser_id"
end
