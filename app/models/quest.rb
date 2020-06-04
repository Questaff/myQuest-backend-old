class Quest < ApplicationRecord
  enum status: [:stored, :unstored]
  enum completion: [:incompleted, :hunter_completed, :author_validated]

  belongs_to :quest_author, class_name: :User, foreign_key: :quest_author_id
  belongs_to :quest_hunter, class_name: :User, foreign_key: :quest_hunter_id, optional: true

  validates :title, presence: true
  validates :quest_author, presence: true

  before_validation :generate_uuid, on: :create

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
