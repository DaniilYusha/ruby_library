# frozen_string_literal: true

require_relative '../modules/data_validation'

# Reader class contatins all data about readers who want to buy a book
class Reader
  include DataValidation
  attr_reader :name, :email, :city, :street, :house, :books

  def initialize(name, email, city, street, house)
    @name = check_empty_s name
    @email = check_empty_s email
    @city = check_empty_s city
    @street = check_empty_s street
    @house = check_positive_num house
  end

  def ==(other)
    return @email == other.email if other.is_a? Reader

    false
  end

  def to_s
    "Reader: #{@name} / #{@email}, #{@city}, #{@street}, #{@house}"
  end
end
