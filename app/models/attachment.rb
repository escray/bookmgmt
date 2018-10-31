class Attachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
  belongs_to :doc
end
