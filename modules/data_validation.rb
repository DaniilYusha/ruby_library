# frozen_string_literal: true

# Module DataValidation contains methods for data validation
module DataValidation
  def compare_classes(class_name, expected_class)
    raise ArgumentError, "Expected class #{class_name}" unless class_name == expected_class
  end

  def check_positive_num(num)
    num = Integer num
    raise ArgumentError, 'Number is not positive or equal 0' unless num >= 1

    num
  end

  def check_empty_s(string)
    raise ArgumentError, 'Argument should be String and not empty' if !string.is_a?(String) || string.strip.empty?

    string
  end
end
