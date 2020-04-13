class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Post.where('content LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

end
