require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/student.rb')
require_relative('models/house.rb')

#NEW
get "/students/new" do
  @house = House.all()
  erb(:new)
end

# INDEX
get "/students" do
  @students = Student.all()
  erb(:index)
end

# get "/houses" do
#   @houses = Houses.all()
#   erb(:index)
# end

# SHOW
get "/students/:id" do
  @student = Student.find(params["id"].to_i)
  erb(:show)
end

# CREATE
post "/students" do
@student = Student.new(params)
@student.save
erb(:create)
end