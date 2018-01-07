require 'spec_helper'

RSpec.describe UserManager do
  context 'without users' do
    subject(:manager) { UserManager.new }

    describe '.user_count' do
      let(:expected_number) { 0 }

      it 'returns 0' do
        expect(manager.user_count).to eq(expected_number)
      end
    end

    describe '.add_user' do
      let(:user) { User.new 1, 'Joe', 'Lopez', '92050411222' }
      let!(:expected_number) { manager.user_count + 1 }

      it 'adds new user to the storage' do
        manager.add_user(user)
        expect(manager.user_count).to eq(expected_number)
        expect(manager.get_user(user.id)).to eq(user)
      end
    end
  end

  context 'with some users' do
    let(:user1) { (User.new 1, 'Jon', 'Son', '91090877666') }
    let(:user2) { (User.new 2, 'Anne', 'Smith', '92050455111') }
    let(:user3) { (User.new 3, 'Mark', 'Twain', '93040333222') }
    let(:users) { [user1, user2, user3] }
    subject(:manager) { UserManager.new users }

    describe '.user_count' do
      let(:expected_number) { 3 }

      it 'returns correct number of users' do
        expect(manager.user_count).to eq(expected_number)
      end
    end

    describe '.get_user' do
      let(:expected_user) { user2 }

      it 'returns correct user' do
        expect(manager.get_user(user2.id)).to eq(expected_user)
      end
    end

    describe '.add_user' do
      let(:user) { User.new 4, 'Jenny', 'Smith', '91050324222' }
      let!(:expected_number) { manager.user_count + 1 }

      it 'adds new user to the storage' do
        manager.add_user(user)
        expect(manager.user_count).to eq(expected_number)
        expect(manager.get_user(user.id)).to eq(user)
      end
    end

    describe '.remove_user' do
      let!(:expected_number) { manager.user_count - 1 }
      let(:id) { 1 }

      it 'removes certain user' do
        user = manager.remove_user(id)
        expect(manager.users).not_to include(user)
        expect(manager.user_count).to eq(expected_number)
      end
    end

    describe '.update_user' do
      let(:updated_user) { User.new 1, 'Jon', 'Don', '91090877666' }

      it 'updates certain user' do
        expect(manager).to receive(:get_user).and_return(users[0], users[0])
        manager.update_user(nil, updated_user)
        expect(manager.get_user(nil).to_s).to eq(updated_user.to_s)
      end
    end
  end
end
