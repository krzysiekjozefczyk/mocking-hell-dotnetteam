require 'spec_helper'

RSpec.describe User do
  context '.new' do
    subject(:user) { User.new 1, 'John', 'Doe', '90010198765' }

    it 'initializes a new user' do
      expect { user }.not_to raise_error
    end
  end
end
