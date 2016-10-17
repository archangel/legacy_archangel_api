require "rails_helper"

module Archangel
  module Api
    module V1
      RSpec.describe TagsController, type: :controller do
        before { stub_authentication! }

        describe "GET #index" do
          let!(:tag) { create(:tag) }

          it "has correct headers" do
            archangel_api_get :index

            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(:ok)
          end

          it "assigns all tags as @tags" do
            archangel_api_get :index

            expect(assigns(:tags)).to eq([tag])
          end
        end

        describe "GET #show" do
          let!(:tag) { create(:tag) }

          it "has correct headers" do
            archangel_api_get :show, params: { id: tag }

            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(:ok)
          end

          it "assigns the requested tag as @tag" do
            archangel_api_get :show, params: { id: tag }

            expect(assigns(:tag)).to eq(tag)
          end
        end
      end
    end
  end
end
