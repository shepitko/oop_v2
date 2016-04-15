module Helper
	def count_obj_value(instance_var, value)
    counted = Hash.new(0)
    instance_var.each { |h| counted[eval("h.#{value}")] += 1 }
    counted = Hash[counted.map {|k,v| [k,v.to_s] }]
  end

  def find_relation(array_of_objects, id)
    array_of_objects.select{ |obj| obj.id == id }[0]
  end

end