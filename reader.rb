require './modules/model_helper.rb'

class Reader

  include ModelHelper

  attr_accessor :id, :name, :email, :city, :street, :house

  def initialize(opt)
    opt = keys_to_symbol opt 
    @id, @name, @email, @city, @street, @house = opt[:id], opt[:name], opt[:email], opt[:city], opt[:street], opt[:house]
  end

  def to_s
    "id:#{@id}, name:#{@name}, email:#{@email}, city:#{@city}, street:#{@street}, house:#{@house}" 
  end
end
