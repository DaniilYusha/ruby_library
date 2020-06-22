# frozen_string_literal: true

require 'yaml'
require_relative '../modules/file_loader'

# Library class can containt entities, save and load data about them, execute some statistic methods
class Library
  include FileLoader
  attr_reader :authors, :books, :orders, :readers

  def initialize
    @authors = []
    @books = []
    @orders = []
    @readers = []
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

  def load
    File.open(File.dirname(__FILE__) + "/../db/#{lib_name}", 'r') do |file|
      @entities = YAML.load_stream(file)
    end
  end

  def top_readers(quantity = 1)
    @entities.select { |entity| entity.is_a? Reader }.max_by(quantity) { |reader| reader.books.uniq.length }
  end

  def top_books(quantity = 1)
    @entities.select { |entity| entity.is_a? Book }.max_by(quantity) { |book| book.readers.uniq.length }
  end

  def readers_count_of_popular_books(quantity = 3)
    top_books(quantity).flat_map(&:readers).uniq.count
  end

  private

  def exists_in_lib?(entity)
    get_entities.any? { |ent| ent == entity }
  end
end
