class JournalDelivery < ApplicationRecord
  belongs_to :journal
  belongs_to :department
end
