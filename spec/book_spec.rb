require 'spec_helper'

RSpec.describe Book do
  describe '.new' do
    subject(:book) { Book.new 1, 'Donald Knuth', 'The Art of Computer Programming', '1968', 'IT' }

    it 'initializes a new book' do
      expect { book }.not_to raise_error
    end
  end
end
