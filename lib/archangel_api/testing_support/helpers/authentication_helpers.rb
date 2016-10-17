module ArchangelApi
  module TestingSupport
    module AuthenticationHelpers
      module Controller
        def stub_authentication!(user = nil)
          allow(controller).to(
            receive(:requires_authentication?).and_return(false)
          )

          allow(controller).to(
            receive(:current_api_user).and_return(user)
          )
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.include(
    ArchangelApi::TestingSupport::AuthenticationHelpers::Controller,
    type: :controller
  )
end
