# require modules here
require 'yaml'
# filepath = 'lib/emoticons.yml'
# hashone = YAML.load_file(filepath)
# pp hashone






def load_library(filepath)
  hashone = YAML.load_file(filepath)
  library = {}
    def englishhash(list)
        hash = {}
        list.each { |key, value|
        hash[value[0]] = value[1]
        }
    hash
    end
ehash = englishhash(hashone)

    def japanesehash(list)
        hash={}
        list.each { |key, value|
            hash[key] = value[1]}
        hash = hash.invert
    hash
    end
jhash = japanesehash(hashone)
library[:get_meaning] = jhash
library[:get_emoticon] = ehash
library
end

def get_japanese_emoticon(path, string)
library = {}
library = load_library(path)
if library[:get_emoticon][string]
    return library[:get_emoticon][string]
  end
return "Sorry, that emoticon was not found"
end


def get_english_meaning(path, string)
library = {}
library = load_library(path)
if library[:get_meaning][string]
    return library[:get_meaning][string]
  end
return "Sorry, that emoticon was not found"
end





