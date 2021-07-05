# require modules here
require "yaml"


def load_library(emoticons)
  emoticons = YAML.load_file('lib/emoticons.yml')
  new_emoticons = { }
 emoticons.each do |word,face|
 new_emoticons[word]={}
 new_emoticons[word][:english]=face[0]
 new_emoticons[word][:japanese]=face[1]
 end
new_emoticons
end




require "pry"
def get_japanese_emoticon (emoticons,marico)
  # code goes here
  new_emoticons = load_library(emoticons)
  new_emoticons.each do |word, carita|
     if carita[:english] == marico
       return carita[:japanese]
     end
   end
   'Sorry, that emoticon was not found'
 end




require "pry"
def get_english_meaning(emoticons,marico)
  # code goes here
  new_emoticons = load_library(emoticons)
  new_emoticons.each do |word, carita|
     if carita[:japanese] == marico
       return word

     end
   end
   'Sorry, that emoticon was not found'
 end
