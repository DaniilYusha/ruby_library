# frozen_string_literal: true

# Reader class contatins all data about readers who want to buy a book
class Reader
  include Validator
  attr_reader :name, :email, :city, :street, :house, :books

  def initialize(name, email, city, street, house)
    check_empty_strings name, email, city, street
    
    @name = name
    @email = email
    @city = city
    @street = street
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
