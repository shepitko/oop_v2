require './modules/model_helper.rb'

class Order

  include ModelHelper
  require 'date'

  attr_accessor :id, :book_id, :reader_id, :date

  def initialize (opt)
    opt = keys_to_symbol opt 
    @id, @book_id, @reader_id, @date = opt[:id], opt[:book_id], opt[:reader_id], opt[:date]
  end

  def to_s
    "id:#{@id}, book_id:#{@book_id}, reader_id,:#{@reader_id}, date:#{@date}" 
  end
end