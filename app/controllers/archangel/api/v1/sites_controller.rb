module Archangel
  module Api
    module V1
      class SitesController < ApiController
        before_action :set_site, only: [:show]

        def show
          respond_with @site, links: { self: api_v1_site_url }
        end

        protected

        def set_site
          @site = current_api_site
        end
      end
    end
  end
end
