require_relative('../db/sql_runner.rb')
require_relative('house.rb')

class Student

  attr_reader :id, :first_name, :second_name
  attr_accessor :house, :age

  def initialize(options)
    @id = options['id'].to_i()
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id']
    @age = options['age'].to_i()
  end

  def save()
    sql = "INSERT INTO students ( first_name, second_name, house_id, age ) VALUES ('#{ @first_name }','#{ @second_name }','#{ @house_id }', '#{ @age }' ) 
    RETURNING *;"
    student_data = SqlRunner.run(sql)
    @id = student_data.first()['id'].to_i
  end

  def Student.all()
    sql = "SELECT * FROM students";
    student_hashes = SqlRunner.run (sql)
    result = student_hashes.map {|student_hash| Student.new(student_hash)}
    return result
  end

  def house()
        sql = "SELECT * FROM houses WHERE id = #{@house_id};"
        house_hash = SqlRunner.run(sql).first
        house = House.new(house_hash)
        return house
  end

  def Student.find(id)
    sql = "SELECT * FROM students WHERE id = #{id};"
    student = SqlRunner.run(sql)
    result = Student.new(student.first)
    return result
  end


end  