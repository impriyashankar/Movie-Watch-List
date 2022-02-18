# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all

require "json"
require "open-uri"

url = 'http://tmdb.lewagon.com/movie/top_rated'
response = URI.open(url).read
response_json = JSON.parse(response)
#response_json = response_json.first(5)
response_arr = response_json["results"]
movie_db = response_arr.last(10)

movie_db.each{|item|
title = item["original_title"]
overview = item["overview"]
rating = item["vote_average"]
poster_url = 'https://image.tmdb.org/t/p/w500/'+item["poster_path"]

Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
}
