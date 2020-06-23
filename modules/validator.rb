# frozen_string_literal: true

# Module DataValidation contains methods for data validation
module Validator
  def compare_classes(class_name, expected_class)
    raise ArgumentError, "Expected class #{class_name}" unless class_name == expected_class
  end

  def check_positive_num(num)
    raise ArgumentError, 'Argument should be a Number and not positive or equal 0' unless num.is_a?(Integer) && num >= 1

    num
  end

  def check_empty_strings(*strings)
    strings.each do |string|
      raise ArgumentError, 'Argument should be String and not empty' if !string.is_a?(String) || string.strip.empty?
    end
  end
end
