require 'spec_helper'

RSpec.describe Transfer do
  context '.new' do
    subject(:account1) { Account.new 1, 'user1', 'pass1', 500.0 }
    subject(:account2) { Account.new 2, 'user2', 'pass2', 500.0 }
    subject(:transfer1) { Transfer.new 1, account1, account2, 100.0 }

    it 'initializes new transfer' do
      expect { transfer1 }.not_to raise_error
    end
  end

  context '.valid?' do
    subject(:account1) { Account.new 1, 'user1', 'pass1', 500.0 }
    subject(:account2) { Account.new 2, 'user2', 'pass2', 500.0 }
    subject(:transfer1) { Transfer.new 1, account1, account2, 100.0 }
    subject(:transfer2) { Transfer.new 2, account1, account2, 1000.0 }

    it 'validates legal transfer' do
      expect(transfer1.valid?).to be true
    end

    it 'validates illegal transfer' do
      expect(transfer2.valid?).to be false
    end
  end
end
