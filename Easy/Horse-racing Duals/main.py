strengths = sorted( int(input()) for i in range(int(input())) )

m = strengths[1] - strengths[0]
for i in range(len(strengths) - 1):
    d = strengths[i + 1] - strengths[i]
    if d < m:
        m = d

print(m)

#min( strengths[i + 1] - strengths[ i ] for i in range(len(strenths))
