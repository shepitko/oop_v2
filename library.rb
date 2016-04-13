require './book.rb'
require './order.rb'
require './reader.rb'
require './author.rb'
require './file_manager.rb'
require './helper.rb'

class Library

  require 'json'
  include FileManager
  include Helper

  attr_accessor :books, :orders, :readers, :authors

  NAMES = ['book', 'order', 'reader', 'author' ]

  def initialize
    @books, @orders, @readers, @authors = [], [], [], []
    NAMES.each{ |name| get_data(name) }
  end

  def statistic
    puts "-=Statistic=-"
    puts "*the best reader: \"#{best_reader}\"" 
    puts "*most popular book: \"#{popular_book}\"" 
    puts "*the number people who have ordered one of the three most popular books: #{one_of_three}"
  end

  def get_all
    puts "-=Books=-", @books 
    puts "-=Orders=-", @orders 
    puts "-=Readers=-", @readers
    puts "-=Authors=-", @authors
  end

  def add_object(obj)
    case obj.class
    when Book
      @books << obj
    when Reader
      @readers << obj
    when Author
      @authors << obj
    when Order
      @orders << obj
    else
      puts"Object not found"
    end 
  end

  private
  def best_reader
    reader_id = count_obj_value(@orders, "reader_id").max_by{|k,v| v}[0] #count_obj_value - method of module Helpers
    find_relation(@readers, reader_id).name #find_ralation - method of module Helpers
  end

  def popular_book
    book_id = count_obj_value(@orders, "book_id").max_by{|k,v| v}[0]
    find_relation(@books, book_id).title
  end

  def one_of_three
    three_popular_books = count_obj_value(@orders, "book_id").sort{|a1,a2| a2[1]<=>a1[1]}[0..2]
    people = count_obj_value(@orders, "reader_id")
    people.each{ |k, v| people[k] = 0;}
    @orders.each do |v| 
      three_popular_books.each{ |value| people[v.reader_id] += 1 if value[0] == v.book_id }
    end
    people.size
  end

  def save_library
     NAMES.each{ |name| save_data(name) }
  end

  
end

library = Library.new
library.get_all
library.statistic
library.add_object(Book.new({"id":"10","title":"asdasda", "author_id":"222"}));