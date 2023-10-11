require 'json'

def write_to_file(obj, filename)
    # serialization : object to hash
    data = obj.map(&:store)
    # generate json from the hash
    data_json = JSON.generate(data)
    # write generated json data to file
    File.write(filename, data_json, mode: 'w')
  end
  def read_from_file(filename)
    if File.exist?(filename) and File.size(filename) != 0
      # read data
      data = File.read(filename)
      # json to hash
      JSON.parse(data)
    else
      # Return empty array if filename does not exist
      []
    end
  end