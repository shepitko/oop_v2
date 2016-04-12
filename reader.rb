class Reader

	attr_accessor :id, :name, :email, :city, :street, :house

	def initialize(opt)
		opt.keys.each{ |key| opt[(key.to_sym)||key] = opt.delete(key) }
		@id, @name, @email, @city, @street, @house = opt[:id], opt[:name], opt[:email], opt[:city], opt[:street], opt[:house]
	end

	def to_s
		"id:#{@id}, name:#{@name}, email:#{@email}, city:#{@city}, street:#{@street}, house:#{@house}" 
	end
end
