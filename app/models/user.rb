class User < ApplicationRecord
  has_many :monsters
  belongs_to :main_monster, class_name: "Monster", required: false
  has_many :battles, dependent: :destroy
end
