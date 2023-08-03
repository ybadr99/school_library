require 'json'

class FileIO
  def self.load_file(file_path)
    json_data = File.read(file_path)
    JSON.parse(json_data)
  rescue Errno::ENOENT
    []
  end

  def self.save_to_file(file_path, data_list)
    # Convert the list of person objects to an array of hashes
    data = data_list.map(&:to_hash)
    File.write(file_path, JSON.pretty_generate(data))
  rescue Errno::ENOENT
    []
  end
end
