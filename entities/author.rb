# frozen_string_literal: true

require_relative '../modules/data_validation'

# Author class contains author name and biography
class Author
  include DataValidation
  attr_accessor :name, :biography

  def initialize(name, biography = '')
    @name = check_empty_s name
    @biography = String biography
  end

  def ==(other)
    return @name == other.name if other.is_a? Author

    false
  end

  def to_s
    "Author: #{@name} / #{@biography}"
  end
end
