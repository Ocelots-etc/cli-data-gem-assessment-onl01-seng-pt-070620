require_relative '../config/key'

class API

  def self.jp_restaurants
    restaurants = RestClient.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=japanese+restaurants+in+NewJersey&key=#{Key.access_key}")
    restaurants_hash = JSON.parse(restaurants)
    # restaurants_list = (restaurants_hash["results"][0]["ChIJq2QlUzjJxokR7N0xUrdPT4Q0"]) #restaurants_hash["results"][0]["ChIJtzzjSqHNxokRbhEj_3fc9XU"])  
    for index in 0..9 do 
      restaurant = restaurants_hash["results"][index]
      Restaurants.new(restaurant["name"], restaurant["formatted_address"], restaurant["opening_hours"], restaurant["rating"], restaurant["user_ratings_total"], restaurant["place_id"] )
    end

  end

end
