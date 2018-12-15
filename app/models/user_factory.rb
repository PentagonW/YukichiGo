class UserFactory
  attr_reader :name, :browser_id

  def initialize(name: "ゲストのノグチ", browser_id:)
    @name = name
    @browser_id = browser_id
  end

  def create
    User.create(name: name, browser_id: browser_id)
  end
end