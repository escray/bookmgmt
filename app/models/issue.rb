class Issue < ApplicationRecord
  mount_uploader :cover, ImageUploader
  belongs_to :magazine
  def title
    'title'
  end
end
