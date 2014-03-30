require 'dht_sensor'

sensor = DhtSensor.new(22,4)
temp, humidity = sensor.to_a
if temp.between?(-0.0001,0.0001) && humidity.between?(-0.0001,0.0001)
  puts "Error: DHT22 is stupid"
  puts "Temp: #{temp}, Humidity:#{humidity}"
else
  puts "Temperature = #{temp*9/5+32} °F"
  puts "Humidity    = #{humidity}%"
end
