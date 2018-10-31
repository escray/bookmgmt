class DocDelivery < ApplicationRecord
  belongs_to :doc
  belongs_to :department
end
