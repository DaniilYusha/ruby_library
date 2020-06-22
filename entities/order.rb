# frozen_string_literal: true

require 'date'
require_relative '../modules/data_validation'

# Order class contains data about ordered books and readers
class Order
  include DataValidation
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    compare_classes Book, book.class
    compare_classes Reader, reader.class
    compare_classes Date, date.class

    @book = book
    @reader = reader
    @date = date
  end

  def to_s
    "Ordered book - #{@book}; " \
    "Reader - #{@reader}; " \
    "Order date: #{@date}"
  end
end
