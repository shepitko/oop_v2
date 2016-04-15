require './book.rb'
require './order.rb'
require './reader.rb'
require './author.rb'
require './modules/file_manager.rb'
require './modules/helper.rb'

class Library

  require 'json'

  include FileManager
  include Helper

  attr_accessor :books, :orders, :readers, :authors

  NAMES = %w{book order reader author}

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
    NAMES.each do |name|
      puts "-=#{name.capitalize}=-", instance_variable_get("@#{name}s")
    end
  end

  def add_object(obj)
    NAMES.each do |name|
      instance_variable_get("@#{name}s") << obj if obj.is_a?(eval("#{name.capitalize}"))
    end
  end

  def save_library
    NAMES.each do |name|
      obj_to_hash = instance_variable_get("@#{name}s").map{ |v| v.to_hash }
      save_data(name, obj_to_hash) # save_data - method of module file_manager
    end
  end

  private
  def best_reader
    reader_id = max_value(@orders, "reader_id") #max_value - method of module Helpers
    find_relation(@readers, reader_id).name #find_ralation - method of module Helpers
  end

  def popular_book
    book_id = max_value(@orders, "book_id")
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
  
end

library = Library.new
library.statistic
library.add_object(Book.new({"id":"10","title":"asdasda", "author_id":"2"}))
library.get_all
library.save_library


#поиск по ключу, добвление с обїектом