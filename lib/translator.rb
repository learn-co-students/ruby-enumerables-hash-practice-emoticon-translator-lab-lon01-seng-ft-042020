# require modules here
require 'pry'
require 'yaml'

def load_library(path)
  YAML.load_file(path).transform_values{|v| {english: v[0], japanese: v[1]}}
end



def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  emoticons.each do |meaning, translations|
    if translations[:english] == emoticon
      return translations[:japanese]
    end
  end
  'Sorry, that emoticon was not found'
end



def get_english_meaning(path, emoticon)
  emoticons = load_library(path)

  emoticons.each do |meaning, translations|
    if translations[:japanese] == emoticon
      return meaning
    end
  end
  'Sorry, that emoticon was not found'
end
