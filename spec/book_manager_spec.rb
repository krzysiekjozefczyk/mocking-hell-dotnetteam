require 'spec_helper'

RSpec.describe BookManager do
  context 'without books' do
    subject(:manager) { BookManager.new }

    describe '.book_count' do
      let(:expected_number) { 0 }

      it 'returns 0' do
        expect(manager.book_count).to eq(expected_number)
      end
    end

    describe '.add_book' do
      let(:book) { Book.new 1, 'John Doe', 'Red Book', 2000 }
      let(:expected_number) { 1 }

      it 'adds new book to the storage' do
        manager.add_book(book)
        expect(manager.book_count).to eq(expected_number)
        expect(manager.get_book(book.id)).to eq(book)
      end
    end
  end

  context 'with some books' do
    let(:books) {
      [
        (Book.new 1, 'Mark Thompson', 'Red Book', 2000),
        (Book.new 2, 'John Doe', 'Green Book', 2001),
        (Book.new 3, 'Kate Anne', 'Blue Book', 2002)
      ]
    }
    subject(:manager) { BookManager.new books }

    describe '.book_count' do
      let(:expected_number) { 3 }

      it 'returns correct number of books' do
        expect(manager.book_count).to eq(expected_number)
      end
    end

    describe '.remove_book' do
      let(:expected_number) { 2 }
      let(:id) { 1 }

      it 'removes certain book' do
        expect(manager).to receive(:get_book).and_return(books[0])
        manager.remove_book(id)
        expect(manager.book_count).to eq(expected_number)
      end
    end

    describe '.update_book' do
      let(:updated_book) { Book.new 2, 'John Doe', 'Yellow Book', 2001 }
      let(:id) { 2 }

      it 'updates certain book' do
        expect(manager).to receive(:get_book).and_return(books[1], books[1])
        manager.update_book(id, updated_book)
        expect(manager.get_book(id).title).to eq(updated_book.title)
      end
    end

    describe '.get_book' do
      let(:target) { books[1] }
      let(:id) { target.id }

      it 'returns correct book' do
        expect(manager.get_book(id)).to eq(target)
      end
    end
  end
end
