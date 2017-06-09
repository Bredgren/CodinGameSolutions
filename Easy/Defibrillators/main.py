import sys
import math

def convertNum(s):
    return math.radians(float(s.replace(",", ".")))

def distance(lonA, latA, lonB, latB):
    x = (lonB - lonA) * math.cos((latA + latB) / 2)
    y = latB - latA
    return math.hypot(x, y) * 6371

lon = convertNum(input())
lat = convertNum(input())

answer = (sys.maxsize, None)

for _ in range(int(input())):
    _, name, _, _, lonB, latB = input().split(";")
    lonB = convertNum(lonB)
    latB = convertNum(latB)
    dist = distance(lon, lat, lonB, latB)
    answer = min(answer, (dist, name))

print(answer[1])

# To debug: print("Debug messages...", file=sys.stderr)
