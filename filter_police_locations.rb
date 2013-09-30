f = File.open("filtered_police_locations.csv", 'w')
f.write("")
f.close

File.open("police_locations.csv", 'r').each_line do |line|
  data = line.split(",")
  lat = data[0]
  long = data[1]

  if long.to_i > -88 && long.to_i < -82
    f = File.open("filtered_police_locations.csv", 'a')
    f.write(line)
    f.close
  end

end
