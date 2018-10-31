#
class Journal < ActiveRecord::Base
  include RankedModel
  ranks :row_order
  mount_uploader :logo, JournalLogoUploader
  has_many :docs, dependent: :delete_all
  has_many :roles, dependent: :delete_all

  validates :name, presence: true
  validates :shortname, presence: true

  has_many :journalDeliveries
  has_many :departments, through: :journalDeliveries

  has_paper_trail

  def member?(user)
    roles.exists?(user_id: user)
  end

  %i[manager editor viewer].each do |role|
    define_method "#{role}?" do |user|
      roles.exists?(user_id: user, role: role)
    end
  end

  def to_param
    shortname.to_s
  end
end
