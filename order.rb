class Order

  require 'date'

  attr_accessor :id, :book_id, :reader_id, :date

  def initialize (opt)
    opt.keys.each{ |key| opt[(key.to_sym)||key] = opt.delete(key) }
    @id, @book_id, @reader_id, @date = opt[:id], opt[:book_id], opt[:reader_id], opt[:date]
  end

  def to_s
    "id:#{@id}, book_id:#{@book_id}, reader_id,:#{@reader_id}, date:#{@date}" 
  end

  def to_hash
  	hash = {}
  	instance_variables.each{|var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
  	hash
  end
end