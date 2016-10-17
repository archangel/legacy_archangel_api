require "rails_helper"

module Archangel
  module Api
    module V1
      RSpec.describe UsersController, type: :controller do
        let!(:current_user) { create(:user) }

        before { stub_authentication!(current_user) }

        describe "GET #index" do
          let!(:user) { create(:user) }

          it "has correct headers" do
            archangel_api_get :index

            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(:ok)
          end

          it "assigns all users as @users" do
            archangel_api_get :index

            expect(assigns(:users)).to eq([current_user, user])
          end
        end

        describe "GET #show" do
          let!(:user) { create(:user) }

          it "has correct headers" do
            archangel_api_get :show, params: { id: user }

            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(:ok)
          end

          it "assigns the requested user as @user" do
            archangel_api_get :show, params: { id: user }

            expect(assigns(:user)).to eq(user)
          end
        end
      end
    end
  end
end
