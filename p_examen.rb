#RaceCar class

CONST = 100.0

class RaceCar
  attr_accessor :name,:average_speed,:nivel

  def initialize(name,times)
   @name = name
   @laptimes = times#array
  end


  #método para obtener velocidad promedio
  def speed_lap(laptime)
    float= CONST/laptime
    speed_lap = float.round(2)
  end

  def average_speed
    aprox_speed = 0
    @laptimes.each do |laptime| 
      aprox_speed += speed_lap(laptime)
    end
    aprox_speed /= 5
    @average_speed = aprox_speed.round(2)
  end

  #método que muestra nivel de cada race car
  def nivel
    if @average_speed < 10
      @nivel='Principiante'
    elsif 10<=@average_speed<20
      @nivel='Normal'
    elsif 20<=@average_speed<30
      @nivel='Medio'
    elsif 30<=@average_speed
      @nivel='Avanzado'
    end

  end

end

#Team class
class Team
  attr_accessor :team

  def initialize(team)
    @team = team
  end

  #método para agregar nuevo race car
  def new_car_for_team(car,team_update)
    
  end

  #método para calcular promedio de velocidad del equipo
  def average_speed_of_team
    aprox_speed_team = 0
    @team.each do |car| 
      aprox_speed_team += car.average_speed
    end
    aprox_speed_team /= team.length
    @average_speed_of_team = aprox_speed_team.round(2)
  end

end

#método para buscar race car
def search(name,team_look)
  inside = false
  team_look.team.each{|car| inside= true if name == car.name}
  if inside
    name + " is a racer"
  else
    name + " is not a racer"
  end
end

#método para generar la tabla
def table(team_table)
  puts "|  Name\t|    Nivel   |"
  team_table.team.each{|car| puts "|#{car.name}\t|#{car.nivel}|"}
end

#método para mostrar nombre y nivel del race car
def car_team_nivel(team_look)
  team_look.team.each{|car| puts "|#{car.name}\t|#{car.nivel}|"}
end

#instancias de RaceCar
car1 = RaceCar.new('Torino',[12,13,12,12,13])
car2 = RaceCar.new('Force',[15,15,16,17,16])
car3 = RaceCar.new('Power',[10,10,11,11,10])
car4 = RaceCar.new('Banjo',[20,18,18,19,18])
car5 = RaceCar.new('Nova',[12,14,16,18,16])
car6 = RaceCar.new('Bolid',[9,10,11,10,10])

#tests

p "car1: #{car1.average_speed} m/s"
#ej. car1: 9.5 m/s
p "car2: #{car2.average_speed} m/s"
#ej. car2: 12.01 m/s
p "car3: #{car3.average_speed} m/s"
#ej. car3: 10.65 m/s
p "car4: #{car4.average_speed} m/s"
#ej. car4: 11.0 m/s
p "car5: #{car5.average_speed} m/s"
#ej. car5: 10.15 m/s
p "car6: #{car6.average_speed} m/s"
#ej. car6: 15.51 m/s

#create a team of cars 
team1 = [car1, car2, car3, car4, car5]
team_one = Team.new(team1)


#test para buscar race car en equipo team_one
p search("Power", team_one) == "Power is a racer"

#calculate average speed of team
p team_one.average_speed_of_team
#ej. 10.66 

table(team_one)

# car_team_nivel(team_one)