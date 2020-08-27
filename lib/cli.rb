class CLI
  # this CLI (Command Line Interface) class contains the user input/output methods
  # TODO: give the user the option of searching for categories within fiction

  # require_relative './repeat_repeat.rb' # require_relative
  # extend RepeatRepeat

  def self.list_restaurants # this class method iterates through the book instances held in the @@all array in the books.rb file
    puts "~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~"#.colorize(:color => :black, :background => :light_white)  # line for spacing aesthetics
    puts "                                  Welcome, but in Japanese!                                    "#.colorize(:color => :yellow, :background => :light_cyan).bold  # Welcomes the user to the bookshelf they are viewing
    puts "~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~     ~~~~~"#.colorize(:color => :black, :background => :light_white)  # line for spacing aesthetics
    Restaurants.all.each_with_index do |restaurant, n| # and outputs an indexed list of my bookshelf book titles
      puts "#{n + 1}. #{restaurant.name}"
    end
      self.choose_a_restaurant # calls the chose_a_book class method from the CLI class
  end


  def self.choose_a_restaurant # see more details about the books on the bookshelf
    puts "~~~~~     ~~~~~     ~~~~~    ~~~~~     ~~~~~     ~~~~~    ~~~~~     ~~~~~     ~~~~~    ~~~~~" #.colorize(:color => :green)  #, :background => :green) # line for spacing aesthetics
    puts "About which book would you like information?" #.colorize(:color => :light_yellow)
    puts " "
    puts "Please select a book by typing the corresponding number followed by ENTER." #.colorize(:color => :light_yellow)
    puts "~~~~~     ~~~~~     ~~~~~    ~~~~~     ~~~~~     ~~~~~    ~~~~~     ~~~~~     ~~~~~    ~~~~~" #.colorize(:color => :green) #, :background => :green) # line for spacing aesthetics

    input = gets.chomp.to_i - 1 # user input is requested and the user input is turned into an integer for indexing purposes
    if input < 0 || input > 19 # user input is outside of the range of the index of my bookshelf, it tells the user they made the wrong selection
      # self.wrong_selection
    end
      restaurant = Restaurants.all[input] # the variable book is becoming the instance which was selected by the user
      @@restaurant = restaurant
      self.get_restaurant_details(self.restaurant) # pulls the details for the book the user selects 
  end

  def self.restaurant
    @@restaurant
  end

  def self.get_restaurant_details(restaurant) # outputs books details based upon user selection
    puts "" # TODO: add other lines and colors for aesthetics and url, more details, too
    puts "___________________________--_-- #{restaurant.name} --_--___________________________" #.colorize(:color => :cyan)  #, :background => :blue)
    puts " /////"
    puts ".-----."
    puts "| JP  |"
    puts "|_____|"
    puts "Restaurant Name: #{restaurant.name}"
    puts "Address: #{restaurant.formatted_address}"
    puts "Opening Hours: #{restaurant.opening_hours}"
    puts "Rating: #{restaurant.rating}"
    puts "User Ratings Total: #{restaurant.user_ratings_total}"
    puts "Place ID for Google Reference: #{restaurant.place_id}"
    # self.user_options
  end

end