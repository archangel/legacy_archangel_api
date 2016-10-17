require "rails_helper"

module Archangel
  module Admin
    RSpec.describe UsersController, type: :controller do
      before { stub_authorization! create(:user) }

      describe "POST #retoken" do
        let(:user) { create(:user) }

        it "regenerates a token for current user" do
          old_token = user.api_token

          archangel_post :retoken, params: { id: user }

          user.reload

          expect(assigns(:user)).to be_persisted

          expect(user.api_token).to_not eq(old_token)

          expect(response).to redirect_to(admin_users_path)
        end
      end
    end
  end
end
