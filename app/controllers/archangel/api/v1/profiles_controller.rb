module Archangel
  module Api
    module V1
      class ProfilesController < ApiController
        before_action :set_profile, only: [:show]

        def show
          respond_with @profile, links: { self: api_v1_profile_url }
        end

        protected

        def set_profile
          @profile = current_api_user
        end
      end
    end
  end
end
