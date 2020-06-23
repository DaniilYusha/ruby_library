# frozen_string_literal: true

# Library class can containt entities, save and load data about them, execute some statistic methods
class Library
  include FileLoader
  include Statistics

  attr_reader :authors, :books, :orders, :readers

  def initialize
    @authors = []
    @books = []
    @orders = []
    @readers = []
    load
  end

  def get_entities
    (@authors + @books + @orders + @readers).flatten
  end

  def add_entities(*entities)
    entities.each do |entity|
      unless exists_in_lib? entity
        @authors << entity if entity.is_a? Author
        @books << entity if entity.is_a? Book
        @orders << entity if entity.is_a? Order
        @readers << entity if entity.is_a? Reader
      end
    end
  end

  private

  def exists_in_lib?(entity)
    get_entities.any? { |ent| ent == entity }
  end
end
