require 'json'

class FileLoader
  def self.load_file(file_path)
    json_data = File.read(file_path)
    JSON.parse(json_data)
  rescue Errno::ENOENT
    []
  end
end
