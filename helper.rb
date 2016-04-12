module Helper
	def count_obj_value(instance_var, value)
    counted = Hash.new(0)
    instance_var.each { |h| counted[eval("h.#{value}")] += 1 }
    counted = Hash[counted.map {|k,v| [k,v.to_s] }]
  end

end