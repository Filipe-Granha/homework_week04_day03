require_relative('../db/sql_runner.rb')
require_relative('student.rb')

class House

  attr_reader :id, :name, :url
  

  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO houses ( name, url ) VALUES ('#{ name }','#{ url }' ) 
    RETURNING *;"
    house_data = SqlRunner.run(sql)
    @id = house_data.first()['id'].to_i
  end

  def House.all()
    sql = "SELECT * FROM houses";
    house_hashes = SqlRunner.run (sql)
    result = house_hashes.map {|house_hash| House.new(house_hash)}
    return result
  end

  def House.find(id)
    sql = "SELECT * FROM houses WHERE id = #{id};"
    house = SqlRunner.run(sql)
    result = House.new(house.first)
    return result
  end


end  