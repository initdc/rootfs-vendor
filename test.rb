# frozen_string_literal: true

require "json"
require "toml-rb"

Dir.children(".").sort!.each do |subdir|
  next unless File.directory?(subdir) && !subdir.start_with?(".")

  Dir.chdir(subdir) do
    Dir.children(".").sort!.each do |file|
      pwd = Dir.pwd
      next unless File.extname(file) == ".toml"

      toml = "#{pwd}/#{file}"
      json = TomlRB.load_file(toml, symbolize_keys: false)
      puts JSON.pretty_generate(json)
      puts
    end
  end
end
