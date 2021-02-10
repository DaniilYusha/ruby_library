# frozen_string_literal: true

# Author class contains author name and biography
class Author
  include Validator
  attr_reader :name, :biography

  def initialize(name, biography = '')
    check_string_class_and_emptiness name
    check_string_class biography
    @name = name
    @biography = biography
  end

  def ==(other)
    (other.is_a? Author) && (@name == other.name)
  end

  def to_s
    "Author: #{@name} / #{@biography}"
  end
end
