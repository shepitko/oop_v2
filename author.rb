require './modules/model_helper.rb'

class Author 

  include ModelHelper

  attr_accessor :id, :name, :biography

  def initialize(opt)
    opt = keys_to_symbol opt 
    @id, @name, @biography = opt[:id], opt[:name], opt[:biography]
  end

  def to_s
    "id:#{@id}, name:#{@name}, biography:#{@biography}"
  end
end
