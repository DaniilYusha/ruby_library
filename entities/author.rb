# frozen_string_literal: true

# Author class contains author name and biography
class Author
  include Validator
  attr_reader :name, :biography

  def initialize(name, biography = '')
    check_empty_strings name
    
    @name = name
    @biography = biography
  end

  def ==(other)
    return @name == other.name if other.is_a? Author

    false
  end

  def to_s
    "Author: #{@name} / #{@biography}"
  end
end
