require "pry"
def nyc_pigeon_organizer(data)
  sorted = Hash.new
  name_array = Array.new
  catalogue_array = Array.new
  result_array = Array.new
  data.each do |key, value|
    value.each do |nest, name|
      name_array.push(name)
    end 
  end
  name_array.flatten!
  name_array.uniq!
  name_array.sort!
  name_array.each do |bird|
    sorted[bird] = {}
  end
  data.each_key do |symbol|
    catalogue_array.push(symbol)
  end
  sorted.each_key do |bird|
   sorted[bird] = Hash[catalogue_array.collect { |item| [item, []] } ]
  end
  
  sorted.each do |bird, info|
    sorted[bird].each do |cat, res| 
      data.each do|key, value|
        value.each do |nest, names|
          names.each do |name|
            #binding.pry
            if name == bird
            sorted[bird][key].push(nest.to_s)
            end
          end
        end  
      end  
      sorted[bird][info].uniq
    end
  end
  binding.pry
  sorted
end
