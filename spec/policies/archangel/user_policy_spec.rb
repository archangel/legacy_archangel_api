require "rails_helper"

module Archangel
  RSpec.describe UserPolicy, type: :policy do
    subject { UserPolicy.new(user, record) }

    let(:user) { create(:user) }
    let(:record) { create(:user) }

    it { should permit(:retoken) }
  end
end
