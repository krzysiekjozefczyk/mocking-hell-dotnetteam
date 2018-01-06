require 'spec_helper'

RSpec.describe BookManager do
  describe('.new') do
    subject(:manager) { BookManager.new }

    it 'initializes a new book manager' do
      expect{ manager }.not_to raise_error
    end
  end

  describe('.get_book_count') do
    context 'without books' do
      subject(:manager) { BookManager.new }
      let(:expected_number) { 0 }

      it 'returns 0' do
        expect(manager.get_book_count).to eq(expected_number)
      end
    end

    context 'with some books' do
      let(:books) { [
        (Book.new 1, 'John Doe', 'Red Book', 2000, 'science'),
        (Book.new 2, 'John Doe', 'Green Book', 2001, 'science'),
        (Book.new 3, 'John Doe', 'Blue Book', 2002, 'science')
      ] }
      subject(:manager) { BookManager.new books }
      let(:expected_number) { 3 }

      it 'returns correct number of books' do
        expect(manager.get_book_count).to eq(expected_number)
      end
    end
  end
end
