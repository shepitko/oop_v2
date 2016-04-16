module ModelHelper
  def to_hash
    hash = {}
    instance_variables.each{|var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
    hash
  end

  def keys_to_symbol opt
    opt.keys.each{ |key| opt[(key.to_sym)||key] = opt.delete(key) }
    opt
  end

end