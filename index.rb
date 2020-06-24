# frozen_string_literal: true

require_relative 'autoload'

lib = Library.new

author1 = Author.new('Eknath Easwaran', 'Some interesting facts')
author2 = Author.new('Elizabeth M.')
author3 = Author.new('Meg Jay')
author4 = Author.new('Jayne Hardy')

book1 = Book.new('The Defining Decade: Why Your Twenties Matter..', author3)
book2 = Book.new('Take Your Time: The Wisdom of Slowing Down', author1)
book3 = Book.new('The Self-Care Project', author4)
book4 = Book.new('Passage Meditation', author1)
book5 = Book.new('Big Magic', author2)

reader1 = Reader.new(
  name: 'Max',
  email: 'max@gmail.com',
  city: 'Kharkiv',
  street: 'Kharkivska st.',
  house: 88
)
reader2 = Reader.new(
  name: 'Oleg',
  email: 'oleg@gmail.com',
  city: 'Kiyv',
  street: 'Kiyvska st.',
  house: 1
)
reader3 = Reader.new(
  name: 'Ivan',
  email: 'ivan@gmail.com',
  city: 'Dnipro',
  street: 'Dniprovska st.',
  house: 39
)
reader4 = Reader.new(
  name: 'Vasya',
  email: 'vasya@gmail.com',
  city: 'Lviv',
  street: 'Lvivska st.',
  house: 55
)
reader5 = Reader.new(
  name: 'Nastya',
  email: 'nastya@gmail.com',
  city: 'Kharkiv',
  street: 'Kharkivska st.',
  house: 246
)

order1 = Order.new(book1, reader2)
order2 = Order.new(book1, reader2)
order3 = Order.new(book2, reader5)
order4 = Order.new(book3, reader3)
order5 = Order.new(book3, reader1)
order6 = Order.new(book3, reader4)
order7 = Order.new(book4, reader3)
order8 = Order.new(book4, reader3)
order9 = Order.new(book5, reader3)
order10 = Order.new(book5, reader2)

lib.add_entities(author1, author2, author3, author4,
                 book1, book2, book3, book4, book5,
                 reader1, reader2, reader3, reader4, reader5,
                 order1, order2, order3, order4, order5,
                 order6, order7, order8, order9, order10)
lib.store lib.entities

puts '~~~~~~~~~~~STATISTICS~~~~~~~~~~~'
puts 'Top reader:'
puts lib.top_readers(lib.orders)
puts "\nThree top readers:"
puts lib.top_readers(lib.orders, 3)
puts "\nMost popular book in the Library:"
puts lib.top_books(lib.orders)
puts "\nTwo most popular books:"
puts lib.top_books(lib.orders, 2)
puts "\nNumber of Readers of the Most Popular Book:"
puts lib.readers_count_of_popular_books(lib.orders, 1)
puts "\nNumber of Readers of three the Most Popular Books:"
puts lib.readers_count_of_popular_books(lib.orders, 3)
