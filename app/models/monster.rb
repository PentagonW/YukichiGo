class Monster < ApplicationRecord
  def display_name
    name || "ノグチ"
  end
end
