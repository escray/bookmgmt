class Magazine < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :issues
end
