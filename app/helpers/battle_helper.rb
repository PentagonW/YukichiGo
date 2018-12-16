module BattleHelper
  def  diffirence_date(date)
    today = Time.zone.today
    difference = today - date
    difference.to_i
  end
end
