#
class Doc < ActiveRecord::Base
  STATUS = %w[available lend].freeze
  LEVEL = %w[open internal sensitive secret classified].freeze

  scope :by_status, ->(s) { where(status: s) }
  scope :by_journal, ->(j) { where(journal_id: j) }

  validates_inclusion_of :status, in: STATUS
  validates_inclusion_of :level, in: LEVEL

  validates :name, presence: true

  before_create :assign_default_state

  # after_create :associate_tags_with_doc
  mount_uploaders :images, DocImageUploader
  serialize :images, JSON

  belongs_to :journal
  belongs_to :editor, class_name: 'User', optional: true
  belongs_to :state, optional: true

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true,
                                              reject_if: :all_blank

  has_many :comments, dependent: :destroy
  # has_many :csv_imports, dependent: :destroy
  has_many :docDeliveries
  has_many :departments, through: :docDeliveries
  has_many :items

  has_and_belongs_to_many :tags, uniq: true

  has_paper_trail

  # attr_accessor :tag_names
  # attr_reader :tag_names
  # def receive
  #   receive.to_s(:ymd)
  # end

  def tag_names
    if tags.any?
      tag_names = ''
      tags.each do |t|
        tag_names << t.name
        tag_names << ' '
      end
      tag_names.chop
    end
  end

  def tag_names=(names)
    @tag_names = names
    names.split.each do |name|
      unless tags.find_by_name(name)
        tags << Tag.find_or_initialize_by(name: name)
      end
    end
  end

  accepts_nested_attributes_for :attachments, reject_if: :all_blank

  private

  def assign_default_state
    self.state ||= State.default
  end

  # def associate_tags_with_doc
  #   if tag_names
  #     tag_names.split.each do |name|
  #       puts 'associate_tags_with_doc' + name
  #       tags << Tag.find_or_create_by(name: name) unless tags.include?(name)
  #     end
  #   end
  # end
end
