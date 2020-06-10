# frozen_string_literal: true

require 'yaml'

# Library class can containt entities, save and load data about them, execute some statistic methods
class Library
  attr_reader :lib_name, :entities

  def initialize
    @lib_name = 'lib.yaml'
    @entities = []
    if File.exist?(File.expand_path(File.dirname(__FILE__) + "/../db/#{lib_name}"))
      load
    else
      File.open(File.dirname(__FILE__) + "/../db/#{lib_name}", 'w')
    end
  end

  def add_entities(*entities)
    entities.each do |item|
      if item.is_a?(Author) || item.is_a?(Book) || item.is_a?(Order) || item.is_a?(Reader)
        @entities << item unless @entities.any? { |ent| ent == item }
      end
    end
  end

  def store
    File.open(File.dirname(__FILE__) + "/../db/#{lib_name}", 'w') do |file|
      @entities.each do |entity|
        file.write(entity.to_yaml)
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
end
