# frozen_string_literal: true

# Book class contains titles, authors and readers of each book
class Book
  include Validator
  attr_reader :title, :author

  def initialize(title, author)
    compare_classes Author, author.class
    check_string_class_and_emptiness title
    @title = title
    @author = author
  end

  def ==(other)
    (other.is_a? Book) && (@title == other.title)
  end

  def to_s
    "Book: #{@title} / #{@author}"
  end
end
