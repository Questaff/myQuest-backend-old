class QuestSerializer < ActiveModel::Serializer
  attributes :uuid, :author, :title, :description, :stored, :quest_master_validation, :quest_hunter_completion, :created_at, :updated_at

  def author
    object&.quest_author&.username
  end
end
