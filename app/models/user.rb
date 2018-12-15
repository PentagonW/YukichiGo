class User < ApplicationRecord
  has_many :monsters
  has_many :battles, dependent: :destroy
end
