require "yaml"
require "pry"

def load_library(emoticons)
  emoticons = YAML.load_file('lib/emoticons.yml')
  new_emoticons = {}
  emoticons.each do |word, face|
      new_emoticons[word]= {}
      new_emoticons[word][:english]= face[0]
      new_emoticons[word][:japanese]= face[1]
  end
  new_emoticons
end

def get_japanese_emoticon(file_path,emoticon)
  new_emoticons = load_library(file_path)
  new_emoticons.each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path,emoticon)
  new_emoticons = load_library(file_path)
  new_emoticons.each do |word, carita|
    if carita[:japanese] == emoticon
      return word
    end
  end
  "Sorry, that emoticon was not found"
  end
