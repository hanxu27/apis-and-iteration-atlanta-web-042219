require 'rest-client'
require 'json'
require 'pry'

def pull_data(link)
# helper method to get data and convert into hash
  response_string = RestClient.get(link)
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character_name)
# call pull_data to get hash then iterate each entry to check if names match
# if names match then return the links of films
# else return "Not found"
  result = pull_data('http://www.swapi.co/api/people/')["results"]

  result.each do |data|
    if character_name == data["name"].downcase
      return data["films"]
    end
  end
  "Not found"
end

def print_movies(films)
  # if films is "Not found" return error
  # else film is an array of links, compare links to 
  # episode_id to get movie titles
  # return array of movie titles
  movie_data = pull_data("https://www.swapi.co/api/films/")["results"]
  results = []
  if films == "Not found"
    puts "Character not found"
    return "Character not found"
  end
  films.each do |link|
    movie_data.each do |data|
      if data["episode_id"] == link[-2].to_i
        puts data["title"]
        results << data["title"]
      end
    end
  end
  results
end

def show_character_movies(character)
# calling get_character_movies_from_api to get array of
# links/films. Calling print_movies to print titles to output
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
