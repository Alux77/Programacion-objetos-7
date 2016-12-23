@@lap_distance = 100

#Es necesario crear una clase RaceCar que contemple el nombre del carro y los tiempos de cada lap que ha registrado
#RaceCar class
class RaceCar
  attr_accessor :name, :average_speed, :nivel

  def initialize(name, times)
   @name = name
   @laptimes = times
  end

  #Se necesita medir para cada carro la velocidad promedio de acuerdo a cinco laptimes registrados.
  #método para obtener velocidad promedio
  def speed_lap(laptime)
    average = @@lap_distance/laptime
    speed_lap = average.round(2)
  end

  def average_speed
    aprox_speed = 0
    @laptimes.each do |laptime| 
      aprox_speed += speed_lap(laptime)
    end
    aprox_speed /= 5
    @average_speed = aprox_speed
  end

  #Crear método que muestre el nivel de cada carro dependiendo de su velocidad (Principiante, Normal, Medio, Avanzado)
  #método que muestra nivel de cada race car
  def nivel
    if @average_speed < 5
      @nivel = "BEGINNER"
    elsif 5 <= @average_speed
      @nivel = "NORMAL"
    elsif 10 <= @average_speed < 15
      @nivel = "MIDIUM"
    elsif 15 <= @average_speed < 20
      @nivel = "RACE KING"
    end
  end
end

#Crear una clase Team que permita formar equipos de carros
#Team class
class Team
  attr_accessor :team

  def initialize(team)
    @team = team
  end

  def add_car(car, car_2_add)
  end

  #Extra - Crea un metodo en team que regrese el promedio de velocidad del equipo
  #método para calcular promedio de velocidad del equipo
  def team_average
    speed = 0
    @team.each do |car| 
      speed += car.average_speed
    end
    speed /= team.length
    @team_average = speed
  end
end

#Crear un método que permita buscar si existe un determinado carro en un equipo
#método para buscar race car
def search_car(name, search)
  inside = false
  search.team.each do |car|
    inside = true if name == car.name
  end

  if inside
    name + " is a racer"
  else
    name + " is not a racer"
  end
end

#Extra - Genera una tabla que muestre el coche y su nivel
#método para generar la tabla
def table(statistics)
  puts "    CODEACAMP RACE STATISTICS"
  puts
  puts "|   Name\t|    Nivel\t|"
  puts "-" * 33

  statistics.team.each do |car|

  puts "|  #{car.name}\t|   #{car.nivel}\t|"
  puts "-" * 33
  end
end

#método para mostrar nombre y nivel del race car
def car_team_nivel(search)
  search.team.each{|car| puts "|#{car.name}\t|#{car.nivel}|"}
end

#instancias de RaceCar
car1 = RaceCar.new("Meteoro", [20, 30, 75, 22, 20])
car2 = RaceCar.new("Rayo McQueen", [50, 33, 21, 24, 10])
car3 = RaceCar.new("Herbie", [10, 44, 32, 16, 66])
car4 = RaceCar.new("General Lee", [30, 55, 34, 10, 7])
car5 = RaceCar.new("Power", [7, 10, 32, 20, 5])
car6 = RaceCar.new("Batmovil", [90, 44, 120, 76, 96])

#tests
p "#{car1.name}: #{car1.average_speed} m/s"
#ej. car1: 9.5 m/s
p "#{car2.name}: #{car2.average_speed} m/s"
#ej. car2: 12.01 m/s
p "#{car3.name}: #{car3.average_speed} m/s"
#ej. car3: 10.65 m/s
p "#{car4.name}: #{car4.average_speed} m/s"
#ej. car4: 11.0 m/s
p "#{car5.name}: #{car5.average_speed} m/s"
#ej. car5: 10.15 m/s
p "#{car6.name}: #{car6.average_speed} m/s"
#ej. car6: 15.51 m/s

#create a team of cars
team1 = [car1, car2, car3, car4, car5]
team_one = Team.new(team1)
puts
#test para buscar race car en equipo team_one
p search_car("Power", team_one) #== "Power is a racer"
puts
#calculate average speed of team
p team_one.team_average
#ej. 10.66
puts
table(team_one)