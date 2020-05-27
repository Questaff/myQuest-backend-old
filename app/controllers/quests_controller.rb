class QuestsController < ApplicationController
  before_action :set_quest, only: [:show]

  # POST /quests
  def create
    quest = Quest.new(quest_create_params)
    if quest.save
      render(status: 200, json: quest)
    else
      render(status: 400, json: quest.errors)
    end
  end

  # GET /quests
  def index
    quests = Quest.all
    render(status: 200, json: quests)
  end

  # GET /quests/:uuid
  def show
    render(status: 200, json: @quest)
  end

  private
    def quest_params
      params.fetch(:quest, {}).permit(:uuid, :quest_author_id, :quest_hunter_id, :title, :description, :stored, :quest_master_validation, :quest_hunter_completion)
    end

    def quest_create_params
      params.fetch(:quest, {}).permit(:quest_author_id, :quest_hunter_id, :title, :description, :stored)
    end

    def quest_show_params
      params.permit(:uuid)
    end

    def set_quest
      @quest = Quest.find_by(uuid: quest_show_params[:uuid])
    end
end


