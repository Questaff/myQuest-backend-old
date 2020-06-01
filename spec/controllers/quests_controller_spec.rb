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
      it 'should return a success response' do
        request.headers.merge!(authenticated_header(create(:user)))
        get :index
        expect(response).to have_http_status(:success)
      end

      it "should returns the right JSON structure" do
        request.headers.merge!(authenticated_header(create(:user)))
        get :index
        json_response = JSON.parse(response.body)
        json_response.each do |status|
          expect(status.keys).to contain_exactly(:uuid, :author, :title, :description, :stored, :quest_master_validation, :quest_hunter_completion, :created_at, :updated_at)
        end
      end
    end
  end
end