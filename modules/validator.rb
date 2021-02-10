# frozen_string_literal: true

# Module Validator contains methods for data validation
module Validator
  def compare_classes(class_name, expected_class)
    raise ArgumentError, "Expected class #{class_name}" unless class_name == expected_class
  end

  def check_positive_integers(*numbers)
    numbers.each do |num|
      raise ArgumentError, 'Argument should be a Number and not positive or equal 0' if !num.is_a?(Integer) || num < 1
    end
  end

  def check_string_class(string)
    raise ArgumentError, 'Argument should be a String' unless string.is_a?(String)
  end

  def check_string_emptiness(string)
    raise ArgumentError, 'String should not be empty' if string.strip.empty?
  end

  def check_string_class_and_emptiness(*strings)
    strings.each do |string|
      check_string_class string
      check_string_emptiness string
    end
  end
end
