# frozen_string_literal: true

require_relative '../modules/data_validation'

# Book class contains titles, authors and readers of each book
class Book
  include DataValidation
  attr_reader :title, :author, :readers

  def initialize(title, author)
    compare_classes Author, author.class
    @title = check_empty_s title
    @author = author
  end

  def ==(other)
    return @title == other.title if other.is_a? Book

    false
  end

  def to_s
    "Book: #{@title} / #{@author}"
  end
end
