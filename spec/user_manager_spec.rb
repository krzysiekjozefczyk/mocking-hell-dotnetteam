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
      let(:user) { UserFactory.create_single_user_without_books }
      let!(:expected_number) { manager.user_count + 1 }

      it 'adds new user to the storage' do
        manager.add_user(user)
        expect(manager.user_count).to eq(expected_number)
        expect(manager.get_user(user.id)).to eq(user)
      end
    end
  end

  context 'with some users' do
    let(:users) { UserFactory.create_array_of_users_without_books }
    subject(:manager) { UserManager.new users }

    describe '.user_count' do
      let(:expected_number) { users.count }

      it 'returns correct number of users' do
        expect(manager.user_count).to eq(expected_number)
      end
    end

    describe '.get_user' do
      let(:expected_user) { users[2] }

      it 'returns correct user' do
        expect(manager.get_user(users[2].id)).to eq(expected_user)
      end
    end

    describe '.add_user' do
      let(:user) { UserFactory.create_single_user_without_books }
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
      let(:updated_user) { UserFactory.create_single_user_without_books }

      it 'updates certain user' do
        expect(manager).to receive(:get_user).and_return(users[0], users[0])
        manager.update_user(nil, updated_user)
        expect(manager.get_user(nil).to_s).to eq(updated_user.to_s)
      end
    end

    describe '.add_book' do
      let(:user) { users[0] }
      let(:book) { BookFactory.create_single_book }
      let!(:expected_user_book_count) { user.overall_rented_books + 1 }

      it 'adds book to user\'s collection' do
        expect(manager).to receive(:get_user).and_return(user)
        expect { manager.add_book(user.id, book) }.to change { user.overall_rented_books }
        expect(user.currently_rented_books).to include(book)
        expect(user.overall_rented_books).to eq(expected_user_book_count)
      end
    end

    describe '.remove_book' do
      let(:user) { users[1] }
      let(:book) { BookFactory.create_single_book }
      let!(:book_count) { user.overall_rented_books }

      it 'doesn\'t remove non-existent book from user' do
        expect { manager.remove_book(user.id, book) }.to raise_error(BookNotFoundError)
        expect(user.overall_rented_books).to eq(book_count)
      end
    end
  end
  context 'one user with some books' do
    let(:user) { UserFactory.create_single_user_with_book }
    let(:book) { user.currently_rented_books[0] }
    subject(:manager) { UserManager.new [user] }

    describe '.remove_book' do
      it 'removes existing book from user' do
        expect(manager.remove_book(user.id, book)).to eq(book)
      end
    end

    describe '.get_book' do
      it 'returns correct book for given user' do
        expect(manager.get_book(user.id, book.id)).to eq(book)
      end
    end
  end
end
