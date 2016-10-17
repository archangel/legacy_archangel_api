module Archangel
  module Api
    module V1
      class CategoriesController < ApiController
        before_action :set_category, only: [:show]

        def index
          @categories = Archangel::Category.page(params[:page])
                                           .per(per_page)

          respond_with @categories, links: { self: api_v1_categories_url }
        end

        def show
          respond_with @category, links: { self: api_v1_category_url(@category) }
        end

        protected

        def set_category
          @category = Archangel::Category.find_by!(slug: params[:id])
        end
      end
    end
  end
end
