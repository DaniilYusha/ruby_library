# frozen_string_literal: true

# Statistics module contains methods for counting top readers, top books, etc.
module Statistics

  def top_readers(orders, quantity = 1)
    grouped_readers = orders.group_by(&:reader).each { |reader, orders| orders.uniq! { |order| order.book } }
    grouped_readers.max_by(quantity) { |reader, orders| orders.size }.flatten.select { |reader| reader.is_a? Reader }
  end

  def top_books(orders, quantity = 1)
    grouped_books = orders.group_by(&:book).each { |book, orders| orders.uniq! { |order| order.reader } }
    grouped_books.max_by(quantity) { |book, orders| orders.size }.flatten.select { |book| book.is_a? Book }
  end

end
