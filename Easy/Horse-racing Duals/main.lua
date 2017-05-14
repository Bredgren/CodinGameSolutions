N = tonumber(io.read())
strengths = {}
for i=1, N do
    strengths[i] = tonumber(io.read())
end

table.sort(strengths)

m = strengths[2] - strengths[1]
for i=2, N-1 do
    d = strengths[i+1] - strengths[i]
    if d < m then
        m = d
    end
end

print(m)

-- To debug: io.stderr:write("Debug message\n")
