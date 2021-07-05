
require "yaml" 
require "pry"

def load_library(file_path) 
  emoticons = YAML.load_file(file_path) 
hash = {} 
emoticons.each do |key, value| hash[key] = { :english => value[0], :japanese => value[1] } 
end 
hash 
end


def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |key,value|
if emoticon == value[:english]
  return value[:japanese]
end
end 
"Sorry, that emoticon was not found"
end 

def get_english_meaning(file_path,emoticon)
 emoticons = load_library(file_path)
 emoticons.each do |key,value|
   if emoticon == value[:japanese]
     return key
      end
   end
 "Sorry, that emoticon was not found"
end