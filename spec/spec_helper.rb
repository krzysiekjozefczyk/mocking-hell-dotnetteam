require 'rspec'
require 'simplecov'

SimpleCov.start do
  add_filter '../spec/factories/book_factory'
  add_filter '../spec/factories/user_factory'
end

require_relative '../lib/user'
require_relative '../lib/book'
require_relative '../lib/book_manager'
require_relative '../lib/user_manager'
require_relative '../lib/library'
require_relative '../spec/factories/user_factory'
require_relative '../spec/factories/book_factory'
