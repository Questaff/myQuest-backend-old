class QuestsController < ApplicationController
  before_action :authenticate_user
  before_action :set_quest, only: [:show, :update, :destroy]

  # POST /quests
  def create
    quest = Quest.new(quest_create_params.merge(quest_author: current_user))
    if quest.save
      render(status: 200, json: quest)
    else
      render(status: 422, json: quest.errors)
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

  # PUT /quests/:uuid
  def update
    if @quest.update(quest_update_params)
      render(status: 200, json: @quest)
    else
      render(status: 422, json: @quest.errors)
    end
  end

  # DELETE /quests/:uuid
  def destroy
    @quest.destroy
    render(status: 200, json: {message: I18n.t("api.deleted")})
  end

  # GET /quests/created_quests
  def created_quests
    render(status: 200, json: current_user.created_quests)
  end

  # GET /quests/accepted_quests
  def accepted_quests
    render(status: 200, json: current_user.accepted_quests)
  end

  # GET /quests/stored_quests
  def stored_quests
    render(status: 200, json: current_user.stored_quests)
  end

  private
    def quest_params
      params.fetch(:quest, {}).permit(:uuid, :quest_author_id, :quest_hunter_id, :title, :description, :stored, :quest_master_validation, :quest_hunter_completion)
    end

    def quest_create_params
      params.fetch(:quest, {}).permit(:quest_author_id, :quest_hunter_id, :title, :description, :stored)
    end

    def quest_get_params
      params.permit(:uuid)
    end

    def quest_update_params
      params.fetch(:quest, {}).permit(:title, :description, :stored, :quest_master_validation)
    end

    def set_quest
      @quest = Quest.find_by(uuid: quest_get_params[:uuid])
      if @quest.nil?
        render(status: 404, json: {message: I18n.t("api.unfound")})
        return
      end
    end
end


