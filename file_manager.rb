module FileManager
	def get_data obj
    File.open("db/#{obj}s.json", "r") do |f|
      JSON.parse(f.read).each{|v| instance_variable_get("@#{obj}s").push(eval(obj.capitalize).new v) } 
    end
  end

  def save_data obj 
		puts JSON.generate object #returns a JSON string
		File.open("db/#{obj}s.json","w"){ |f| f.puts instance_variable_get("@#{obj}s").to_json }
  end

end