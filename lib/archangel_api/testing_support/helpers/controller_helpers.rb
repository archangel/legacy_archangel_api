module ArchangelApi
  module TestingSupport
    module ControllerHelpers
      extend ActiveSupport::Concern

      included do
        routes { Archangel::Engine.routes }
      end

      def archangel_api_get(action, *args)
        process_archangel_api_action(action, :get, *args)
      end

      def archangel_api_post(action, *args)
        process_archangel_api_action(action, :post, *args)
      end

      def archangel_api_put(action, *args)
        process_archangel_api_action(action, :put, *args)
      end

      def archangel_api_patch(action, *args)
        process_archangel_api_action(action, :patch, *args)
      end

      def archangel_api_delete(action, *args)
        process_archangel_api_action(action, :delete, *args)
      end

      private

      def process_archangel_api_action(action, method = :get, *args)
        params = args.first.blank? ? {} : args.first

        params.merge!(
          method: method,
          format: :json
        )

        process(action, params)
      end
    end
  end
end

RSpec.configure do |config|
  config.include(
    ArchangelApi::TestingSupport::ControllerHelpers,
    type: :controller
  )
end
