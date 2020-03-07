class QuestsController < ApplicationController

  # POST /quests
  def create
    @quest = Quest.new(quests_creation_params)
    if @quest.save
      render(status: 200, json: @quest)
    else
      render(status: 400, json: @quest.errors)
    end
  end


  def quests_params
    params.fetch(:quest, {}).permit(:quest_author_id, :quest_hunter_id, :title, :description, :stored, :quest_master_validation, :quest_hunter_completion)
  end

  def quests_creation_params
    params.fetch(:quest, {}).permit(:quest_author_id, :quest_hunter_id, :title, :description, :stored)
  end
end


