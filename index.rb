# frozen_string_literal: true

require_relative 'entities/author'
require_relative 'entities/book'
require_relative 'entities/library'
require_relative 'entities/order'
require_relative 'entities/reader'

lib = Library.new
lib.entities.clear

author1 = Author.new('Eknath Easwaran', 'Some interesting facts')
author2 = Author.new('Elizabeth M.')
author3 = Author.new('Meg Jay')
author4 = Author.new('Jayne Hardy')

book1 = Book.new('The Defining Decade: Why Your Twenties Matter..', author3)
book2 = Book.new('Take Your Time: The Wisdom of Slowing Down', author1)
book3 = Book.new('The Self-Care Project', author4)
book4 = Book.new('Passage Meditation', author1)
book5 = Book.new('Big Magic', author2)

reader1 = Reader.new('Max', 'max@gmail.com', 'Kharkiv', 'Kharkivska st.', 88)
reader2 = Reader.new('Oleg', 'oleg@gmail.com', 'Kiyv', 'Kiyvska st.', 1)
reader3 = Reader.new('Ivan', 'ivan@gmail.com', 'Dnipro', 'Dniprovska st.', 39)
reader4 = Reader.new('Vasya', 'vasya@gmail.com', 'Lviv', 'Lvivska st.', 55)
reader5 = Reader.new('Nastya', 'nastya@gmail.com', 'Kharkiv', 'Kharkivska st.', 246)

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
lib.store

puts "Now Library contents #{lib.entities.count} entities."
puts '~~~~~~~~~~~STATISTICS~~~~~~~~~~~'
puts 'Top reader:'
puts lib.top_readers
puts "\nThree top readers:"
puts lib.top_readers(3)
puts "\nMost popular book in the Library:"
puts lib.top_books
puts "\nTwo most popular books:"
puts lib.top_books(2)
puts "\nNumber of Readers of the Most Popular Book:"
puts lib.readers_count_of_popular_books(1)
puts "\nNumber of Readers of three the Most Popular Books:"
puts lib.readers_count_of_popular_books
