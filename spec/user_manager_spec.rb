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
  end

  context 'with some users' do
    let(:users) {
      [
        (User.new 1, 'Jon', 'Son', '91090877666'),
        (User.new 2, 'Anne', 'Smith', '92050455111'),
        (User.new 3, 'Mark', 'Twain', '93040333222')
      ]
    }
    subject(:manager) { UserManager.new users }

    describe '.user_count' do
      let(:expected_number) { 3 }

      it 'returns correct number of users' do
        expect(manager.user_count).to eq(expected_number)
      end
    end
  end
end
