class AddAdjective
  attr_accessor :noguchi

  def initialize(noguchi)
    @noguchi = noguchi
  end

  def update_adjective
    adjective_noguchi
    noguchi.save
  end

  def adjective_noguchi
    noguchi.name = "#{ramdom_adjective_word.name} #{noguchi.name}"
  end

  private

    def ramdom_adjective_word
      return 'みんなの' unless AdjectiveWord.all&.size > 1

      AdjectiveWord.where( 'id >= ?', rand(AdjectiveWord.first.id..AdjectiveWord.last.id) ).first
    end
end
