class User < ApplicationRecord
  has_secure_password

  PASSWORD_FORMAT = /\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).*\z/
  has_many :quests, foreign_key: :quest_author_id
  has_many :quests, foreign_key: :quest_hunter_id

  before_validation :generate_uuid, on: :create

  validates :username, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z0-9_]+\z/, message: I18n.t("api.invalid_username")}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :password, presence: true, format: { with: PASSWORD_FORMAT, message: I18n.t("api.invalid_password") }
  validates :password_confirmation, presence: true
  validates :phone_number, presence: true, phone: { possible: true, countries: [:fr, :be, :ca]}

  validates_length_of :password, within: 8..64



  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

  def created_quests
    Quest.where(quest_author: self)
  end

  def accepted_quests
    Quest.where(quest_hunter: self)
  end

  def stored_quests
    self.created_quests.where(stored: true)
  end

  def password_validation
    self.password.include?
  end
end
