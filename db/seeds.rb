require 'json'
require 'open-uri'

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=YOUR API KEY GOES HERE'
movies_serialized = URI.parse(url).read
movies = JSON.parse(movies_serialized)['results']

movies.each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie['backdrop_path']}",
    rating: movie['vote_average'].round(1)
  )
end
