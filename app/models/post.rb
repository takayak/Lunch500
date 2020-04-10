class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  has_many :comments
  
  mount_uploader :image, ImageUploader
end
