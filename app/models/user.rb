class User < ApplicationRecord
  has_secure_password

  has_many :quests, foreign_key: :quest_author_id
  has_many :quests, foreign_key: :quest_hunter_id

  before_validation :generate_uuid, on: :create

  validates :username, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :phone_number, presence: true, phone: { possible: true, countries: [:fr, :be, :ch, :ca]}

  validates_length_of :password, within: 8..20

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

  def to_token_payload
    {
      sub: uuid,
      email: email
    }
  end
end
