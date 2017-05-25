function convertNum(s)
    s = s:gsub(",", ".")
    return tonumber(s) / 180 * math.pi
end

function distance(lonA, latA, lonB, latB)
   x = (lonB - lonA) * math.cos((latA + latB) / 2)
   y = latB - latA
   return math.sqrt(x*x + y*y) * 6371
end

lon = convertNum(io.read())
lat = convertNum(io.read())

answer = ""
minDist = 0

n = tonumber(io.read())
for i=0,n-1 do
    defib = io.read()
    name, lonBstr, latBstr = defib:match(".*;(.*);.*;.*;(.*);(.*)")
    lonB = convertNum(lonBstr)
    latB = convertNum(latBstr)
    dist = distance(lon, lat, lonB, latB)
    if answer == "" or dist < minDist then
        answer = name
        minDist = dist
    end
end

print(answer)

-- To debug: io.stderr:write("Debug message\n")
