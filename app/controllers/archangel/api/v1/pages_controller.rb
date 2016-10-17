module Archangel
  module Api
    module V1
      class PagesController < ApiController
        before_action :set_page, only: [:show]

        def index
          @pages = Archangel::Page.page(params[:page])
                                  .per(per_page)

          respond_with @pages, links: { self: api_v1_pages_url }
        end

        def show
          respond_with @page, links: { self: api_v1_page_url(@page) }
        end

        protected

        def set_page
          @page = Archangel::Page.find_by!(id: params[:id])
        end
      end
    end
  end
end
