spot1 = Category4.create(name: '静岡')
spot2 = Category4.create(name: '富士')

spot1_children_array = ['駿府城公園', '日本平動物園', '静岡大学', 'マークイズ東静岡']
spot2_children_array = ['田子浦漁港', 'かぐや姫ミュージアム', '中央公園', '吉原商店街']
spot1_grandchildren_array = [
  ['徳川家康ゆかりの城。'], # 金融の子
  ['レッサーパンダに会える動物園'], # 経済の子
  ['素晴らしい大学'], # 経営の子
  ['一日いられるショッピングセンター'] # マーケティングの子
]
spot2_grandchildren_array = [
  ['釣り禁止の場所が多いので気を付ける'], # 金融の子
  ['かぐや姫についての博物館'], # 経済の子
  ['大規模な公園'], # 経営の子
  ['富士駅近くの商店街よりは栄えている'] # マーケティングの子
]

spot1_children_array.each_with_index do |children, index|
  children = spot1.children.create(name: children)
  spot1_grandchildren_array[index].each do |grandchildren|
    children.children.create(name: grandchildren)
  end
end

spot2_children_array.each_with_index do |children, index|
  children = spot2.children.create(name: children)
  spot2_grandchildren_array[index].each do |grandchildren|
    children.children.create(name: grandchildren)
  end
end

spot1 = Category5.create(name: '静岡')
spot2 = Category5.create(name: '富士')

spot1_children_array = ['駿府城公園', '日本平動物園', '静岡大学', 'マークイズ東静岡']
spot2_children_array = ['田子浦漁港', 'かぐや姫ミュージアム', '中央公園', '吉原商店街']
spot1_grandchildren_array = [
  ['徳川家康ゆかりの城。'], # 金融の子
  ['レッサーパンダに会える動物園。
    レストラン併設のテレビでは歴史が学べる。'], # 経済の子
  ['素晴らしい大学'], # 経営の子
  ['一日いられるショッピングセンターです。映画館はありませんが、ゆったりと座れるソファ、のんびりできるカフェ、大きな無印良品がわたしたちを癒してくれます。'] # マーケティングの子
]
spot2_grandchildren_array = [
  ['釣り禁止の場所が多いので気を付ける'], # 金融の子
  ['かぐや姫についての博物館'], # 経済の子
  ['大規模な公園'], # 経営の子
  ['富士駅近くの商店街よりは栄えている'] # マーケティングの子
]

spot1_children_array.each_with_index do |children, index|
  children = spot1.children.create(name: children)
  spot1_grandchildren_array[index].each do |grandchildren|
    children.children.create(name: grandchildren)
  end
end

spot2_children_array.each_with_index do |children, index|
  children = spot2.children.create(name: children)
  spot2_grandchildren_array[index].each do |grandchildren|
    children.children.create(name: grandchildren)
  end
end

