module FileManager
	def get_data obj
    File.open("db/#{obj}s.json", "r") do |f|
      JSON.parse(f.read).each{|v| instance_variable_get("@#{obj}s").push(eval(obj.capitalize).new v) } 
    end
  end

  def save_data

  end

end