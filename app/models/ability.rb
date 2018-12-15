class Ability < ApplicationRecord
  belongs_to :monster, inverse_of: :ability

  before_create :set_type

  enum type: { attack: 0, defense: 1, throw: 2 }

  private

    def set_type
      type ||= rand(3)
    end
end
