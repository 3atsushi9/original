class Tweet < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  mount_uploader :image, ImageUploader
  belongs_to :user
end
