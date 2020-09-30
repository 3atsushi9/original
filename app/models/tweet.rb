class Tweet < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  mount_uploader :image, ImageUploader
end
