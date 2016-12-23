#Athlete class
class Athlete

  attr_reader  :speed_record
  attr_accessor :total_time, :total_distance

  def initialize(distance = 0, time = 0)
    @speed_record = 0.0
    @total_distance = distance    
    @total_time =  valid_time?(time) ? time : 0
    @speed_record = speed
  end

  #método para validar tiempo
  def valid_time?(time)
    time > 0
  end

  #método para hacer ejercicio
  def new_workout(distance, time)
    @total_distance += distance
    @total_time += time
  end

  #método para obtener velocidad del atleta
  def speed
    current_speed = @total_time == 0 ? 0 : @total_distance.fdiv(@total_time).round(2)
    @speed_record = current_speed if current_speed < @speed_record || @speed_record == 0
    current_speed
  end

  def statistics
    new_speed = speed
    "#{@total_distance} meters, time: #{@total_time} seconds, speed: #{new_speed} m/s"
  end

end

# #Runner class

class Runner < Athlete

  def run
    "Ran " + statistics
  end

end

#Swimmer class
class Swimmer < Athlete 

  def swim
    "Swam " + statistics
  end

end

#Cyclist class
class Cyclist < Athlete

  def ride_bike
    "Rode " + statistics
  end

end

#tests
#instancias de atletas con distancia en metros
runner = Runner.new()
swimmer = Swimmer.new(50, 10)
cyclist = Cyclist.new(70, 27)

athletes = [runner, swimmer, cyclist]

athletes.each do |athlete|
  #¿qué tipo de atleta es?
  puts "#{athlete.class} responds to:"
  puts "\tAthlete speed: #{athlete.respond_to?(:speed) == true}"
  puts "\tGet Athlete time: #{athlete.respond_to?(:total_time) == true}"
  puts "\tSet Athlete time: #{athlete.respond_to?(:total_time=) == true}"
  puts "\tSpeed record: #{athlete.respond_to?(:speed_record) == true}"
  puts "\tGet Distance: #{athlete.respond_to?(:total_distance) == true}"
  puts "\tSet Distance: #{athlete.respond_to?(:total_distance=) == true}"
  puts "\trun method: #{athlete.respond_to?(:run) == true}" if athlete == runner
  puts "\tswim method: #{athlete.respond_to?(:swim) == true}" if athlete == swimmer
  puts "\tride_bike method: #{athlete.respond_to?(:ride_bike) == true}" if athlete == cyclist
  puts "\n\n"
end

#test for runner
#test para runner con distancia = 0
p runner.run == "Ran 0 meters, time: 0 seconds, speed: 0 m/s"
#test para runner al hacer ejercicio, incrementa distancia = 20 metros y tiempo = 7 segundos
runner.new_workout(20, 7) 
#test para runner con distancia = 20 metros y tiempo = 7 segundos
p runner.run == "Ran 20 meters, time: 7 seconds, speed: 2.86 m/s"
runner.new_workout(40, 5) 
#test para runner con distancia = 20 metros y tiempo = 7 segundos
p runner.run == "Ran 60 meters, time: 12 seconds, speed: 5.0 m/s"

p runner.speed_record == 2.86
#test para swimmer con distancia = 50
p swimmer.swim == "Swam 50 meters, time: 10 seconds, speed: 5.0 m/s"