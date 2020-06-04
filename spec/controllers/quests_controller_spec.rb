require 'rails_helper'
require 'auth_helper'

RSpec.describe QuestsController do
  describe "GET #index" do
    context 'when the request with NO authentication header' do
      it 'should return an unauthorized response' do
        get :index
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the request contains an authentication header' do
      before do
        request.headers.merge!(authenticated_header(create(:user)))
        get :index
      end

      it 'should return a success response' do
        expect(response).to have_http_status(:success)
      end

      it "should returns the right JSON structure" do
        json_response = JSON.parse(response.body)
        json_response.each do |status|
          expect(status.keys).to contain_exactly(:uuid, :author, :title, :description, :stored, :quest_master_validation, :quest_hunter_completion, :created_at, :updated_at)
        end
      end
    end
  end

  describe "GET #show" do
    before do
      user = create(:user)
      @quest = create(:quest, quest_author: user)
    end

    context 'when the request with NO authentication header' do
      it 'should return an unauthorized response' do
        get :show, params: { uuid: @quest.uuid }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the request contains an authentication header' do
      before do
        request.headers.merge!(authenticated_header(create(:user)))
        get :show, params: { uuid: @quest.uuid }
      end

      it 'should return a success response' do
        expect(response).to have_http_status(:success)
      end

      it "should return the right JSON object" do
        expect(JSON[response.body]).to eql({
          "uuid" => @quest.uuid,
          "author" => @quest.quest_author.username,
          "title" => @quest.title,
          "description" => @quest.description,
          "stored" => @quest.stored,
          "quest_master_validation" => @quest.quest_master_validation,
          "quest_hunter_completion" => @quest.quest_hunter_completion,
          "created_at" => JSON[@quest.created_at.to_json],
          "updated_at" => JSON[@quest.updated_at.to_json]
        })
      end
    end
  end

  describe "POST #create" do
    valid_params = { :title => "Test quest creation" }
    invalid_params = { :description => "Test quest w/o title"}
    headers = { :HTTP_ACCEPT => "application/json", :CONTENT_TYPE => "application/json" }

    context 'when the request with NO authentication header' do
      it 'should return an unauthorized response' do
        request.headers.merge! headers
        post :create, body: valid_params.to_json, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with valid attributes" do
      it "creates a quest" do
        expect do
          request.headers.merge!(authenticated_header(create(:user)))
          request.headers.merge! headers
          post :create, body: valid_params.to_json, as: :json
        end.to change(Quest, :count).by(+1)
      end

      it "has the correct response" do
        request.headers.merge!(authenticated_header(create(:user)))
        request.headers.merge! headers
        post :create, body: valid_params.to_json, as: :json
        expect(response).to have_http_status(:success)
        expect(JSON[response.body]).to eql({
          "uuid" => Quest.last.uuid,
          "author" => Quest.last.quest_author.username,
          "title" => Quest.last.title,
          "description" => Quest.last.description,
          "stored" => Quest.last.stored,
          "quest_master_validation" => Quest.last.quest_master_validation,
          "quest_hunter_completion" => Quest.last.quest_hunter_completion,
          "created_at" => JSON[Quest.last.created_at.to_json],
          "updated_at" => JSON[Quest.last.updated_at.to_json]
        })
      end
    end

    context "with invalid attributes" do
      it "does not create a quest" do
        expect do
          request.headers.merge!(authenticated_header(create(:user)))
          request.headers.merge! headers
          post :create, body: invalid_params.to_json, as: :json
        end.to_not change(Quest, :count)
      end

      it "has the correct response" do
        request.headers.merge!(authenticated_header(create(:user)))
          request.headers.merge! headers
          post :create, body: invalid_params.to_json, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end