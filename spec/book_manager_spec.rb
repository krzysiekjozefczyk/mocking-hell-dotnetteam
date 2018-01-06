require 'spec_helper'

RSpec.describe BookManager do
  describe('.new') do
    subject(:manager) { BookManager.new }

    it 'initializes a new book manager' do
      expect{ manager }.not_to raise_error
    end
  end
end
