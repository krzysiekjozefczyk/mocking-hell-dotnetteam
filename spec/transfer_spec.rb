require 'spec_helper'

RSpec.describe Transfer do
  context '.new' do
    subject(:account1) { Account.new 1, 'user1', 'pass1' }
    subject(:account2) { Account.new 2, 'user2', 'pass2' }
    subject(:transfer) { Transfer.new 1, account1, account2, 100.0 }

    it 'initializes new transfer' do
      expect { transfer }.not_to raise_error
    end
  end
end
