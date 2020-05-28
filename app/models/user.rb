class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  has_many :quests, foreign_key: :quest_author_id
  has_many :quests, foreign_key: :quest_hunter_id
end
