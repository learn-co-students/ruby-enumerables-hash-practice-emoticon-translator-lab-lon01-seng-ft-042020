# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  library = YAML.load_file(file_path)
  hash = {}
  library.each do |name, emoticon|
    emoticon.each do |english, japanese|
      hash[name] = {:english => emoticon[0], :japanese => emoticon[1]}
    end 
  end 
  hash 
end  

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  result = ""
  hash.each do |name, emoticons|
    if emoticons[:japanese] == emoticon
      result = name
    end
  end
  if result == ""
    "Sorry, that emoticon was not found"
     else 
      result
  end  
end 

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  result = ""
  hash.each do |name, emoticons|
    if emoticons[:english] == emoticon
      result = emoticons[:japanese]
    end
  end
  if result == ""
    "Sorry, that emoticon was not found"
     else 
      result
  end  
end 