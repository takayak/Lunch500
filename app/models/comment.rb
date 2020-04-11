class Comment < ApplicationRecord
  belongs_to :post  # postsテーブルとのアソシエーション
  belongs_to :user
end
