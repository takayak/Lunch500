class Category < ActiveHash::Base
  self.data = [
      {id: 1, name: '中華'}, {id: 2, name: '洋食'}, {id: 3, name: 'フレンチ'},
      {id: 4, name: '和食'}, {id: 5, name: 'ファーストフード'}, {id: 6, name: 'その他'}
  ]
end