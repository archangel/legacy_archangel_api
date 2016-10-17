require "rails_helper"

module Archangel
  module Api
    module V1
      RSpec.describe CategoriesController, type: :controller do
        before { stub_authentication! }

        describe "GET #index" do
          let!(:category) { create(:category) }

          it "has correct headers" do
            archangel_api_get :index

            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(:ok)
          end

          it "assigns all categories as @categories" do
            archangel_api_get :index

            expect(assigns(:categories)).to eq([category])
          end
        end

        describe "GET #show" do
          let!(:category) { create(:category) }

          it "has correct headers" do
            archangel_api_get :show, params: { id: category }

            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(:ok)
          end

          it "assigns the requested category as @category" do
            archangel_api_get :show, params: { id: category }

            expect(assigns(:category)).to eq(category)
          end
        end
      end
    end
  end
end
