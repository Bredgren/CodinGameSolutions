strengths = sorted( int(raw_input()) for i in range(int(raw_input())) )
print min( strengths[i + 1] - strengths[ i ] for i in range(len(strengths) - 1) )
