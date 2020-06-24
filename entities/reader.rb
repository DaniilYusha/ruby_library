# frozen_string_literal: true

# Reader class contatins all data about readers who want to buy a book
class Reader
  include Validator
  attr_reader :name, :email, :city, :street, :house, :books

  def initialize(name:, email:, city:, street:, house:)
    check_string_class_and_emptiness name, email, city, street
    check_positive_integers house

    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def ==(other)
    (other.is_a? Reader) && (@email == other.email)
  end

  def to_s
    "Reader: #{@name} / #{@email}, #{@city}, #{@street}, #{@house}"
  end
end
