AdjectiveWord.create(name: "かっこいい", power: 45)
AdjectiveWord.create(name: "ちょっと足の速い", power: 30)
AdjectiveWord.create(name: "髪の毛の多い", power: 10)
AdjectiveWord.create(name: "yahooの", power: 55)
AdjectiveWord.create(name: "足の短い", power: 100)
AdjectiveWord.create(name: "お金持ちな", power: 2)
AdjectiveWord.create(name: "電気に強い", power: 90)
AdjectiveWord.create(name: "漢字検定3級の", power: 77)
AdjectiveWord.create(name: "天然パーマな", power: 99)
AdjectiveWord.create(name: "明るい", power: 88)
AdjectiveWord.create(name: "みえそうで見えない", power: 45)
AdjectiveWord.create(name: "かしこそうな", power: 82)
AdjectiveWord.create(name: "イケてる", power: 43)

["strength", "defence", "speed", "intelligence", "special"].each do |name|
  Ability.create  name: name
end
