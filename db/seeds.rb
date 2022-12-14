# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

url = "https://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
results = JSON.parse(user_serialized)["results"]
movie_title = []
movie_overview = []
movie_poster_url = []
results.each do |result|
  movie_title << result["original_title"]
  movie_overview << result["overview"]
  movie_poster_url << "https://image.tmdb.org/t/p/w500" + result["poster_path"]
end
# puts movie_title
# puts movie_overview
# puts movie_poster_url

puts "Clearing database..."
Movie.delete_all

puts "Creating movie datasets..."

10.times do
  movie = Movie.create(title: movie_title.sample, overview: movie_overview.sample, poster_url: movie_poster_url.sample, rating: rand(0..5))
  puts movie
  puts "Created #{movie.id}"
end
# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
puts "Done!"
