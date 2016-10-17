module Archangel
  module Api
    module V1
      class TagsController < ApiController
        before_action :set_tag, only: [:show]

        def index
          @tags = Archangel::Tag.page(params[:page])
                                .per(per_page)

          respond_with @tags, links: { self: api_v1_tags_url }
        end

        def show
          respond_with @tag, links: { self: api_v1_tag_url(@tag) }
        end

        protected

        def set_tag
          @tag = Archangel::Tag.find_by!(slug: params[:id])
        end
      end
    end
  end
end
