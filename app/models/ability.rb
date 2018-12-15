class Ability < ApplicationRecord
  belongs_to :monster, inverse_of: :ability

  before_create :set_type

  private

    def set_type
      type ||= rand(3)
    end
end
