require "rails_helper"

module Archangel
  RSpec.describe User, type: :model do
    describe "ActiveModel validations" do
      it { expect(subject).to have_db_index(:api_token).unique(:true) }
    end
  end
end
