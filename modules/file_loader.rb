# frozen_string_literal: true

require 'yaml/store'

module FileLoader
  LIB_FILE_NAME = 'lib.yaml'

  def store(entities)
    store = YAML::Store.new "db/#{LIB_FILE_NAME}"
    store.transaction do
      store['Authors'] = entities.select { |author| author.is_a? Author }
      store['Books'] = entities.select { |book| book.is_a? Book }
      store['Readers'] = entities.select { |reader| reader.is_a? Reader}
      store['Orders'] = entities.select { |order| order.is_a? Order }
    end
  end

  def load
    if File.exist? "db/#{LIB_FILE_NAME}"
      File.open("db/#{LIB_FILE_NAME}", 'r') do |file|
        YAML.safe_load(file, [Author, Book, Reader, Order, Date], [], true).values.flatten
      end
    end
  end
end
