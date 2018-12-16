class ExperienceForm
  include ActiveModel::Model

  attr_accessor :winner, :loser
  
  def save
    winner.update_experience winner_calculator
    loser.update_experience loser_calculator
  end

  def winner_calculator
    @winner_calculator ||= ExperienceCalculator.new monster: winner, opponent: loser, judge: true
  end

  def loser_calculator
    @loser_calculator ||= ExperienceCalculator.new monster: loser, opponent: winner, judge: false
  end
end
