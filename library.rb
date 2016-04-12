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

  def initialize
    @books, @orders, @readers, @authors = [], [], [], []
    class_name = ['book', 'order', 'reader', 'author' ]
    class_name.each{ |name| get_data(name) }
  end

  def statistic
    puts "-=Statistic=-"
    puts "*the best reader: id_tmp(\"#{best_reader}\")" 
    puts "*most popular book: id_tmp(\"#{popular_book}\")" 
    puts "*the number people who have ordered one of the three most popular books: #{one_of_three}"
  end

  def get_all
    puts "-=Books=-", @books 
    puts "-=Orders=-", @orders 
    puts "-=Readers=-", @readers
    puts "-=Authors=-", @authors
  end

  private
  def best_reader
    count_obj_value(@orders, "reader_id").max_by{|k,v| v}[0]
  end

  def popular_book
    count_obj_value(@orders, "book_id").max_by{|k,v| v}[0]
  end

  def one_of_three
    #in process
  end


end

library = Library.new
library.get_all
library.statistic