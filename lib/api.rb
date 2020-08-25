class API

  def self.jp_restaurants
    restaurants = RestClient.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=japanese+restaurants+in+NewJersey&key=#{key}")
    restaurant_hash = JSON.parse(restaurant)
    restaurants.each_with_index do |restaurant, n|
            
      # description = self.scrub_html(bookshelf_hash[:volumeInfo][:description])
      # description = self.wrap_text(description)
      Restaurants.new(restaurant_hash["name"], restaurant_hash["formatted_address"], restaurant_hash["opening_hours"], restaurant_hash["rating"], restaurant_hash["user_ratings_total"])
    end
  end  
end
