require 'spec_helper'

RSpec.describe Transfer do
  context '.new' do
    subject(:account1) { Account.new 1, 'user1', 'pass1', 500.0 }
    subject(:account2) { Account.new 2, 'user2', 'pass2', 500.0 }
    subject(:transfer) { Transfer.new 1, account1, account2, 100.0 }

    it 'initializes new transfer' do
      expect { transfer }.not_to raise_error
    end

    it 'validates legal transfer' do
      expect transfer.valid?.to be_truthy
    end
  end
end
