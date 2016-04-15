require './modules/model_helper.rb'

class Book

  include ModelHelper

  attr_accessor :id, :title, :author_id

  def initialize(opt)
    opt = keys_to_symbol opt 
    @id, @title, @author_id = opt[:id], opt[:title], opt[:author_id]
  end

  def to_s
    "id:#{@id}, title:#{@title}, author_id:#{@author_id}"
  end
end
