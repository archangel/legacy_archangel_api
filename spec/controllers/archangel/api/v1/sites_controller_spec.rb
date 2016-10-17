require "rails_helper"

module Archangel
  module Api
    module V1
      RSpec.describe SitesController, type: :controller do
        before { stub_authentication! }

        describe "GET #show" do
          let!(:site) { create(:site) }

          it "has correct headers" do
            archangel_api_get :show

            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(:ok)
          end

          it "assigns the requested category as @category" do
            archangel_api_get :show

            expect(assigns(:site)).to eq(site)
          end
        end
      end
    end
  end
end
