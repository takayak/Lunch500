class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Post.where('content LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

end
