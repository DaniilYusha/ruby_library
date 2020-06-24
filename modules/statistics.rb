# frozen_string_literal: true

# Statistics module contains methods for counting top readers, top books, etc.
module Statistics
  def top_readers(orders, qty = 1)
    grouped_readers = orders.group_by(&:reader).each { |_reader, r_orders| r_orders.uniq!(&:book) }
    grouped_readers.max_by(qty) { |_reader, r_orders| r_orders.size }.flatten.select { |reader| reader.is_a? Reader }
  end

  def top_books(orders, qty = 1)
    grouped_books = orders.group_by(&:book).each { |_book, b_orders| b_orders.uniq!(&:reader) }
    grouped_books.max_by(qty) { |_book, b_orders| b_orders.size }.flatten.select { |book| book.is_a? Book }
  end

  def readers_count_of_popular_books(orders, qty = 3)
    orders.map { |order| order.reader if top_books(orders, qty).include? order.book }.compact.uniq.count
  end
end
