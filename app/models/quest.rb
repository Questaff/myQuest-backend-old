class Quest < ApplicationRecord
  belongs_to :quest_author, class_name: :User, foreign_key: :quest_author_id
  belongs_to :quest_hunter, class_name: :User, foreign_key: :quest_hunter_id, optional: true

  before_validation :generate_uuid, on: :create

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end