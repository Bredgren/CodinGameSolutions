def convertNum(s)
    s.sub(/,/, '.').to_f / 180 * Math::PI
end

def distance(lonA, latA, lonB, latB)
    x = (lonB - lonA) * Math::cos((latA + latB) / 2)
    y = latB - latA
    Math.hypot(x, y) * 6371
end

lonA = convertNum(gets.chomp)
latA = convertNum(gets.chomp)
n = gets.to_i

minDist = 0
answer = ""

n.times do
    _, name, _, _, lonB, latB = gets.chomp.split(";")
    dist = distance(lonA, latA, convertNum(lonB), convertNum(latB))
    if answer == "" or dist < minDist
        minDist = dist
        answer = name
    end
end

puts answer

# To debug: STDERR.puts "Debug messages..."

# Cool soutions by others
# def calcDist lonA, latA, lonB, latB
#     lonA,latA,lonB,latB = [lonA,latA,lonB,latB].map{|c| c.tr(",",".").to_f}
#     x = (lonB - lonA) * Math.cos((latA + latB) / 2)
#     y = (latB - latA)
#     d = Math.sqrt(x**2 + y**2) * 6371
#     return d
# end
#
# Defib = Struct.new(:id, :nom, :adr, :no ,:lon, :lat, :dist)
# loc=[]
#
# lon,lat,n = gets,gets,gets.to_i
#
# n.times do
#     l=Defib.new(*gets.chomp.split(";"))
#     l.dist = calcDist(l.lon, l.lat, lon, lat)
#     loc << l
# end
#
# puts loc.min_by{|s| s.dist}.nom

###

# def distance(lonA, latA, lonB, latB)
#     x = (lonB - lonA) * Math.cos( (latA + latB) / 2)
#     y = latB - latA
#     return Math.sqrt(x*x + y*y) * 6371
# end
#
# @lon = gets.chomp
# @lat = gets.chomp
# @n = gets.to_i
# @lon[/,/] = '.'
# @lat[/,/] = '.'
# @lon = @lon.to_f
# @lat = @lat.to_f
#
# @dist = 999999999
# @n.times do
#     defib = gets.chomp.split(";")
#     lon = defib[4]
#     lat = defib[5]
#     lon[/,/] = '.'
#     lat[/,/] = '.'
#     lon = lon.to_f
#     lat = lat.to_f
#     thisDistance = distance(@lon, @lat, lon, lat)
#     if (thisDistance < @dist)
#         @dist = thisDistance
#         @closest = defib[1]
#     end
# end
#
# puts @closest

###

# LON = gets.sub(?,, ?.).to_f
# LAT = gets.sub(?,, ?.).to_f
#
# puts gets.to_i.times.map{
#     items = gets.split(?;)
#     lon = items[4].sub(?,, ?.).to_f
#     lat = items[5].sub(?,, ?.).to_f
#
#     # Distance
#     x = (LON - lon) * Math::PI / 180 * Math.cos((LAT + lat) / 2 * Math::PI / 180)
#     y = (LAT - lat) * Math::PI / 180
#     [x*x + y*y, items[1]]
# }.min[1]
