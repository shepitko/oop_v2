class Author 

	attr_accessor :id, :name, :biography

	def initialize(opt)
		opt.keys.each{ |key| opt[(key.to_sym)||key] = opt.delete(key) }
		@id, @name, @biography = opt[:id], opt[:name], opt[:biography]
	end

	def to_s
		"id:#{@id}, name:#{@name}, biography:#{@biography}"
	end
end