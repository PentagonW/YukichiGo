class Ability < ApplicationRecord
  belongs_to :monster, inverse_of: :ability
end
