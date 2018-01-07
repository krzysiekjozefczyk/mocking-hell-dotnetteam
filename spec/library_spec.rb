require 'spec_helper'

RSpec.describe Library do
  context 'with pre-baked book and user' do
    let(:user) { UserFactory.create_single_user_without_books }
    let(:book) { BookFactory.create_single_book }

    let(:book_manager) { instance_double('BookManager') }
    let(:user_manager) { instance_double('UserManager') }

    subject(:library) { Library.new user_manager, book_manager }

    describe '.rent_book' do
      it 'marks book as rented by correct user' do
        allow(user_manager).to receive(:get_user).with(user.id).and_return(user)
        allow(book_manager).to receive(:get_book).with(book.id).and_return(book)
        allow(user_manager).to receive(:add_book).with(user.id, book)

        expect { library.rent_book(user.id, book.id) }.to change { book.rented_by }.from(nil).to(user.id)
      end
    end
  end

  context 'with pre-baked user with a rented book' do
    let(:user) { UserFactory.create_single_user_with_book }
    let(:book) { user.currently_rented_books[0] }

    let(:book_manager) { instance_double('BookManager') }
    let(:user_manager) { instance_double('UserManager') }

    subject(:library) { Library.new user_manager, book_manager }

    describe '.return_book' do
      it 'marks book as not rented' do
        allow(user_manager).to receive(:get_user).with(user.id).and_return(user)
        allow(book_manager).to receive(:get_book).with(book.id).and_return(book)
        allow(user_manager).to receive(:remove_book).with(user.id, book)

        expect { library.return_book(user.id, book.id) }.to change { book.rented_by }.from(user.id).to(nil)
      end
    end
  end
end
