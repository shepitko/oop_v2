require './book.rb'
require './order.rb'
require './reader.rb'
require './author.rb'

class Library

	require 'json'

	attr_accessor :books, :orders, :readers, :authors

	def initialize
		@books, @orders, @readers, @authors = [], [], [], []
		class_name = ['book', 'order', 'reader', 'author' ]
		class_name.each{ |name| data name }
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

	private

	def data obj
		File.open("db/#{obj}s.json", "r") do |f|
		  JSON.parse(f.read).each{|v| instance_variable_get("@#{obj}s").push(eval(obj.capitalize).new v) } 
		end
	end

	def best_reader

	end

	def popular_book

	end

	def one_of_three

	end
end

library = Library.new
library.get_all