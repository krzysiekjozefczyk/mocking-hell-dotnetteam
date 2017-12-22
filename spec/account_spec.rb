require 'spec_helper'

RSpec.describe Account do
  context '.new' do
    subject(:account1) { Account.new 1, 'user1', 'pass1'}

    it 'initializes new account' do
      expect { account1 }.not_to raise_error
    end
  end
end
