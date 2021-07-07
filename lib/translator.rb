require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  hash = {}
  emoticons.each do |key, value|
    hash[key] = {
      :english => value[0],
      :japanese => value[1]
    }
   end
  hash
end

def get_japanese_emoticon(file_path, english)
 library = load_library(file_path)
 answer = ""
 library.each do |key, value|
  if value[:english] == english
    answer<< value[:japanese]
  end
 end
 
if answer == ""
  answer << "Sorry, that emoticon was not found"
end
 answer
 
end

def get_english_meaning(file_path, japanese)
 library = load_library(file_path)
 answer = ""
 library.each do |key, value|
  if value[:japanese] == japanese
    answer<< key
  end
 end
 
 if answer == ""
   answer << "Sorry, that emoticon was not found"
 end
 answer
end