# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  data = YAML.load_file(file)
  hash = {}
  data.each do |key, value|
    hash[key] = {}
    
      hash[key] = {:english => value[0], :japanese => value[1]}
    #binding.pry
      end
return hash
end

def get_japanese_emoticon(file, eng)
  hash = load_library(file)
  hash.each do |key, value|
    #binding.pry
    if hash[key][:english] == (eng)
        return hash[key][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, jap)
  hash = load_library(file)
  hash.each do |key, value|
    if hash[key][:japanese].include?(jap)
     # binding.pry
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end