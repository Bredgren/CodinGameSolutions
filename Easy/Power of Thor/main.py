light_x, light_y, thor_x, thor_y = [int(i) for i in input().split()]
dx = light_x - thor_x
dy = light_y - thor_y

# Thor never reverses direction so we can decide it here.
horiz = "E" if dx > 0 else "W"
vert = "S" if dy > 0 else "N"
dx = abs(dx)
dy = abs(dy)

while True:
    input() # The remaining amount of turns Thor can move. Do not remove this line.

    direction = (vert if dy > 0 else "") + (horiz if dx > 0 else "")
    dx = max(dx - 1, 0)
    dy = max(dy - 1, 0)

    print(direction)
