n = int(input())  # the number of temperatures to analyse
closest = 5526 if n else 0
for i in input().split():
    # t: a temperature expressed as an integer ranging from -273 to 5526
    t = int(i)
    if abs(t) < abs(closest) or (t + closest == 0 and t > closest):
        closest = t

print(closest)


# # diziaq
# input()  # skip
# ln = input() or '0'
#
# temps = [int(s) for s in ln.split()]
#
# temps.sort(key = lambda x: (abs(x),-x))
#
# #print(temps, file=sys.stderr)
#
# print(temps[0])
