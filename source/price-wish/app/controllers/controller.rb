class Controller
  def initialize
    puts "Who are you?"
    name = gets.chomp
    user = User.find_by(name: name)
    if user.nil?
      user = User.create(name: name)
      puts "Welcome #{user.name}!"
    else
      puts "Welcome back #{user.name}!"
    end

    results = product_search

    puts "Which one best matches your wish?"

    results.each_with_index do |item, index|
      puts "#{index+1}. #{item["name"]}"
    end

    choice = gets.chomp.to_i

    choiceUPC = results[choice-1]["upc"]
    if choiceUPC.nil?
      puts "invalid upc, please try again (ie exit and start over)"
    else
      vendor_results = upc_search(choiceUPC)
    end

    puts "How much would you pay for #{results[choice-1]["name"]}?"
    print "$"

    wish_price = gets.chomp
    wish = Wish.new(price: wish_price, state: "pending")
    wish.user = user

    # puts "We found your item at the following stores:"
    # vendor_results.each do |item, index|
    #   puts "#{index+1}. #{item["store"]} at #{item["price"].to_s}"
    # end

    puts "Here's what we found for your item:"
    puts vendor_results["store"]
    puts "sells it for: $" + "%.02f" % vendor_results["price"] + "!"

    if vendor_results["price"].to_f > wish_price.to_f
      puts "That's only $" + "%.02f" % (vendor_results["price"].to_f - wish_price.to_f) + " more than your max price!"
    else
      puts "Want to purchase right now?! Give me your credit card info!"
    end

  end
end
