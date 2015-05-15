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
    puts "What item do you wish for?"
    search = gets.chomp

    # runs search from Jonathan & co

    results = ["Nike 1", "Nike 2", "Nike 3"]

    puts "Which one best match your wish?"
    results.each_with_index do |item, index|
      puts "#{index+1}. #{item}"
    end

    choice = gets.chomp.to_i

    puts "How much would you pay for #{results[choice-1]}?"

    wish_price = gets.chomp.to_i
    wish = Wish.new(price: wish_price, state: "pending")
    wish.user = user
    p wish
    p wish.price
    # wish.save
  end
end
