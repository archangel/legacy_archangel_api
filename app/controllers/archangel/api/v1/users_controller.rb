module Archangel
  module Api
    module V1
      class UsersController < ApiController
        before_action :set_user, only: [:show]

        def index
          @users = Archangel::User.page(params[:page])
                                  .per(per_page)

          respond_with @users, links: { self: api_v1_users_url }
        end

        def show
          respond_with @user, links: { self: api_v1_user_url(@user) }
        end

        protected

        def set_user
          @user = Archangel::User.find_by!(username: params[:id])
        end
      end
    end
  end
end

#
# render json: conferences, links: { self: conferences_url, meta: { pages: 10 } }
#
