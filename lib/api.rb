require_relative '../config/key'

class API

  def self.jp_restaurants
    restaurants = RestClient.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=japanese+restaurants+in+NewJersey&key=#{Key.access_key}")
    restaurants_hash = JSON.parse(restaurants)
    restaurants_list = (restaurants_hash["results"][0]["ChIJq2QlUzjJxokR7N0xUrdPT4Q0"], restaurants_hash["results"][0]["ChIJtzzjSqHNxokRbhEj_3fc9XU"])  
    restaurants_hash.each_with_index do |restaurant, n|
      Restaurants.new(restaurants_hash["results"][0]["name"], restaurants_hash["results"][0]["formatted_address"], restaurants_hash["results"][0]["opening_hours"], restaurants_hash["results"][0]["rating"], restaurants_hash["results"][0]["user_ratings_total"], restaurants_hash["results"][0]["place_id"])
    end
  end

end
