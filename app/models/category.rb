class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ファッション' },
    { id: 3, name: '美容・コスメ' },
    { id: 4, name: '家電・スマホ・カメラ' },
    { id: 5, name: 'スポーツ・レジャー' },
    { id: 6, name: 'ハンドメイド' },
    { id: 7, name: 'おもちゃ・ホビー・グッズ' },
    { id: 8, name: '家庭用品・インテリア' },
    { id: 9, name: '本・音楽・ゲーム' },
    { id: 10, name: 'ベビー・キッズ' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
