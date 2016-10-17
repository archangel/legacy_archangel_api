require "rails_helper"

module Archangel
  module Api
    module V1
      RSpec.describe ProfilesController, type: :controller do
        let!(:current_user) { create(:user) }

        before { stub_authentication!(current_user) }

        describe "GET #show" do
          it "has correct headers" do
            archangel_api_get :show

            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(:ok)
          end

          it "assigns the requested category as @category" do
            archangel_api_get :show

            expect(assigns(:profile)).to eq(current_user)
          end
        end
      end
    end
  end
end
