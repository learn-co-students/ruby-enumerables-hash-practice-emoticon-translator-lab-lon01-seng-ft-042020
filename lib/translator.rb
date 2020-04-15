# require modules here
require "yaml"

def load_library(lib_path)
  # code goes here
  raw_YAML = YAML.load_file(lib_path)
  result_hash = {}
  raw_YAML.each do |key,value|
    result_hash[key]={
      english: value[0],
      japanese: value[1]
    }
  end
  result_hash
end

# puts load_library("lib/emoticons.yml")

def get_japanese_emoticon(lib_path, emot)
  # code goes here
  lib_hash = load_library(lib_path)
  lib_hash.each do |key,values|
    if lib_hash[key].has_value?(emot)
      return lib_hash[key][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(lib_path, emot)
  # code goes here
  lib_hash = load_library(lib_path)
  lib_hash.each do |key,values|
    if lib_hash[key].has_value?(emot)
      return key.to_s
    end
  end
  return "Sorry, that emoticon was not found"
end

# puts get_english_meaning("lib/emoticons.yml", "☜(⌒▽⌒)☞")
