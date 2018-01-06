require 'spec_helper'

RSpec.describe User do
  describe '.new' do
    subject(:user) { User.new 1, 'John', 'Doe', '90010198765' }

    it 'initializes a new user' do
      expect { user }.not_to raise_error
    end
  end

  describe '.to_s' do
    subject(:user) { User.new 1, 'John', 'Doe', '90010198765' }

    it 'returns formatted first name and last name' do
      expect(user.to_s).to be_a(String).and include('John Doe')
    end
  end
end
