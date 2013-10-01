f = File.open("filtered_police_locations.csv", 'w')
f2 = File.open("heatmap_data.js", "w")
f2.write("var taxiData = [new google.maps.LatLng(0,0)")
f2.close
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

    f2 = File.open("heatmap_data.js", 'a')
    f2.write(",")
    f2.write("\n")
    f2.write("new google.maps.LatLng(" + data[0] + ", " + data[1] + ")")
    f2.close
  end

end
f2 = File.open("heatmap_data.js", 'a')
f2.write("];")
f2.close
