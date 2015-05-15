require 'json'
require 'net/http'

#input
puts "Hi! What do you want to search for?"
user_search = gets.chomp

#####BEST BUY NAME SEARCH
user_search.gsub!(" ","&search=")

user_search_uri = URI("http://api.remix.bestbuy.com/v1/products(search=#{user_search})?show=name,upc,regularPrice,salePrice,&format=json&apiKey=#{best_buy_key}")

best_buy_result = JSON.parse(api_result = Net::HTTP.get(user_search_uri))
# puts best_buy_result

product_info = best_buy_result["products"]
# puts product_info


#####UPC SEARCH
upc_array = product_info.map { |product| product["upc"] }.compact
# puts upc_array

product_info_array = []
upc_array.each do |upc|
  upc_search_uri = URI("http://www.searchupc.com/handlers/upcsearch.ashx?request_type=3&access_token=#{search_upc_key}&upc=#{upc}")

  temp_hash = JSON.parse(api_result = Net::HTTP.get(upc_search_uri))["0"]

  limited_data = { "name" => temp_hash["productname"],
                   "price" => temp_hash["price"],
                   "saleprice" => temp_hash["saleprice"],
                   "store" => temp_hash["storename"]
                  }
  product_info_array << limited_data
end

puts product_info_array


