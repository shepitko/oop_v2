class Book

  attr_accessor :id, :title, :author_id

  def initialize(opt)
    opt.keys.each{ |key| opt[(key.to_sym)||key] = opt.delete(key) }
    @id, @title, @author_id = opt[:id], opt[:title], opt[:author_id]
  end

  def to_s
    "id:#{@id}, title:#{@title}, author_id:#{@author_id}"
  end

  def to_hash
  	hash = {}
  	instance_variables.each{|var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
  	hash
  end
end
