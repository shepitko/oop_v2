module FileManager
  def get_data obj
    File.open("db/#{obj}s.json", "r") do |f|
      JSON.parse(f.read).each{|v| instance_variable_get("@#{obj}s").push(eval(obj.capitalize).new v) } 
    end
  end

  def save_data(name, obj)
    File.open("db/#{name}s.json","w") do |f| 
      f.puts JSON.pretty_generate(obj)
    end
  end

end