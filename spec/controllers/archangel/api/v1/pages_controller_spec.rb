require "rails_helper"

module Archangel
  module Api
    module V1
      RSpec.describe PagesController, type: :controller do
        before { stub_authentication! }

        describe "GET #index" do
          let!(:page) { create(:page) }

          it "has correct headers" do
            archangel_api_get :index

            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(:ok)
          end

          it "assigns all pages as @pages" do
            archangel_api_get :index

            expect(assigns(:pages)).to eq([page])
          end
        end

        describe "GET #show" do
          let!(:page) { create(:page) }

          it "has correct headers" do
            archangel_api_get :show, params: { id: page }

            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(:ok)
          end

          it "assigns the requested page as @page" do
            archangel_api_get :show, params: { id: page }

            expect(assigns(:page)).to eq(page)
          end
        end
      end
    end
  end
end
