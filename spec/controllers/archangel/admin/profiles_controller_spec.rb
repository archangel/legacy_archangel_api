require "rails_helper"

module Archangel
  module Admin
    RSpec.describe ProfilesController, type: :controller do
      let!(:profile) do
        profile = create(:user)

        stub_authorization!(profile)

        profile
      end

      describe "POST #retoken" do
        it "regenerates a token for current user" do
          old_token = profile.api_token

          archangel_post :retoken

          profile.reload

          expect(assigns(:profile)).to be_persisted

          expect(profile.api_token).to_not eq(old_token)

          expect(response).to redirect_to(admin_profile_path)
        end
      end
    end
  end
end
