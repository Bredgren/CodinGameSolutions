import sys
import math

def convertNum(s):
    return math.radians(float(s.replace(",", ".")))

def distance(lonA, latA, lonB, latB):
    x = (lonB - lonA) * math.cos((latA + latB) / 2)
    y = latB - latA
    return math.sqrt(x*x + y*y) * 6371

lon = convertNum(raw_input())
lat = convertNum(raw_input())
n = int(raw_input())

minDist = 0
answer = None

for _ in xrange(n):
    defib = raw_input().split(";")
    dist = distance(lon, lat, convertNum(defib[4]), convertNum(defib[5]))
    if answer is None or dist < minDist:
        minDist = dist
        answer = defib[1]

print answer

# To debug: print >> sys.stderr, "Debug messages..."
