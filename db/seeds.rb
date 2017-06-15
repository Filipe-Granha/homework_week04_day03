require_relative('../models/student.rb')
require_relative('../models/house.rb')
require('pry-byebug')


house1 = House.new({
  "name" => "Gryffindor",
  "url" => "http://www.google.co.uk"
  })
house1.save

house2 = House.new({
  "name" => "Ravenclaw",
  "url" => "http://www.google.co.uk"
  })
house2.save

house3 = House.new({
  "name" => "Hufflepuff",
  "url" => "http://www.google.co.uk"
  })
house3.save

house4 = House.new({
  "name" => "Slytherin",
  "url" => "http://www.google.co.uk"
  })
house4.save

student1 = Student.new({
  "first_name" => "Harry",
  "second_name" => "Potter",
  "house_id" => house1.id,
  "age" => 22
  })
student1.save

student2 = Student.new({
  "first_name" => "Ron",
  "second_name" => "Weasley",
  "house_id" => house3.id,
  "age" => 20
  })
student2.save


