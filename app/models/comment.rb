class Comment < ApplicationRecord
  # before_create :set_previous_state
  # after_create :set_doc_state
  after_create :associate_tags_with_doc

  # belongs_to :state, optional: true
  # belongs_to :previous_state, class_name: 'State', optional: true
  belongs_to :doc
  belongs_to :author, class_name: 'User', optional: true

  scope :persisted, -> { where.not(id: nil) }

  validates :text, presence: true

  delegate :journal, to: :doc

  attr_accessor :tag_names

  private

  # def set_doc_state
  #   doc.state = state
  #   doc.save!
  # end
  #
  # def set_previous_state
  #   self.previous_state = doc.state
  # end

  def associate_tags_with_doc
    if tag_names
      tag_names.split.each do |name|
        doc.tags << Tag.find_or_create_by(name: name)
      end
    end
  end
end
