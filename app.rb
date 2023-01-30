require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry-byebug"

get "/" do
  # "Hello batch 1105!"
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurants/:id" do
  restaurant_id = params[:id]
  @restaurant = Restaurant.find(restaurant_id)
  # binding.pry
  erb :show
end

post "/restaurants" do
  # binding.pry
  name = params[:name]
  city = params[:city]
  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save
  redirect "/"
end

# GET (to get the data - read)
# POST (to create/add data - create)
# PUT/PATCH (to update)
# DELETE (to delete)
