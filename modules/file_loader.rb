# frozen_string_literal: true

require 'yaml/store'

module FileLoader
  LIB_FILE_NAME = 'lib.yaml'

  def store(entities)
    store = YAML::Store.new "db/#{LIB_FILE_NAME}"
    store.transaction do
      store['authors'] = entities.select { |author| author.is_a? Author }
      store['books'] = entities.select { |book| book.is_a? Book }
      store['orders'] = entities.select { |order| order.is_a? Order }
      store['readers'] = entities.select { |reader| reader.is_a? Reader}
    end
  end

end
