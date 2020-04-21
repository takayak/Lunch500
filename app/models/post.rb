class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  def self.search(search)
    if search
      Post.where('content LIKE(?)', "%#{search}%")
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
  
end
