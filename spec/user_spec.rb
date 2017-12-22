require 'spec_helper'

RSpec.describe User do
  context '.new' do
    subject(:user1) { User.new 1, 'John', 'Doe' }

    it 'initializes new user' do
      expect { user1 }.not_to raise_error
    end
  end
end
